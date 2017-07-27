# mysql_bug

This is a small repo to demo a bug in the crystal-db / crystal-mysql

I'm not sure which, but I thought I'd create this min example to help explain.

Just run Crystal spec (with a local mysql running)

It'll create a database called mysql_bug and then remove it at the end.

The bug is that query errors seem to reduce the number available connections until they're all used up.
Not sure if they're not being release back to the pool or something else.

## Installation

```
git clone git@github.com:crisward/mysql_bug.git
cd mysql_bug
crystal deps
crystal spec
```

## Update

This pull request fixes the issue - https://github.com/crystal-lang/crystal-db/pull/65

It was being caused when you try to build a prepared query which is invalid.
MySQL raises any exception, but the connection didn't get released back to the pool

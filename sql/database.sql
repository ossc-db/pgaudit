-- Set up relations for regression test.
-- Required databases are created by init.sql script.
CREATE USER foo_user;
CREATE USER bar_user;

\c foo
CREATE FUNCTION test_func() RETURNS INT AS
$$
BEGIN
    RETURN 0;
END;
$$ LANGUAGE plpgsql;

\c bar
CREATE FUNCTION test_func() RETURNS INT AS
$$
BEGIN
    RETURN 0;
END;
$$ LANGUAGE plpgsql;

-- Test for database rule.
-- SQL on 'foo' database must be logged.

-- logged
\c foo foo_user
SELECT test_func();

-- not logged
\c bar foo_user
SELECT test_func();

From: chrubis@suse.cz (Cyril Hrubis)
Date: Mon, 8 Apr 2019 13:43:06 +0200
Subject: [RFC PATCH 0/2] Kselftest shell (or even C) API
In-Reply-To: <20190406214915.16914-1-pvorel@suse.cz>
References: <20190406214915.16914-1-pvorel@suse.cz>
Message-ID: <20190408114306.GB2418@rei.lan>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190408114306.JOcqRy3eXNIklL-ptG7RGPXan3aKpaoLhNsdyxpdDNU@z>

Hi!
> It's just a small example how things could be. Draft, not meant to be
> really merged. But instead of defining shell library (with more useful
> helpers), I'd rather adopt LTP shell [1] and C [2] API to kselftest.
> LTP API [1] is more like a framework, easy to use with a lot of helpers
> making tests 1) small, concentrating on the problem itself 2) have
> unique output. API is well documented [3] [4], it's creator Cyril Hrubis
> made it after years experience of handling (at the time) quite bad
> quality LTP code.  Rewriting LTP tests to use this API improved tests a
> lot (less buggy, easier to read).
> 
> Some examples of advantages of LTP API:
> * SAFE_*() macros for C, which handles errors inside a library
> * unified messages, unified test status, unified way to exit testing due
> missing functionality, at the end of testing there is summary of passed,
> failed and skipped tests
> * many prepared functionality for both C and shell
> * handling threads, parent-child synchronization
> * setup and cleanup functions
> * "flags" for defining requirements or certain functionality (need root, temporary
> directory, ...)
> * and many other

I guess that I can help to create a library with a subset of LTP C API
that could be used to implement C tests if that is something that has a
good chance to get adopted.

-- 
Cyril Hrubis
chrubis at suse.cz

From: rdunlap at infradead.org (Randy Dunlap)
Date: Wed, 17 Oct 2018 16:12:00 -0700
Subject: [RFC v1 00/31] kunit: Introducing KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <20181016235120.138227-1-brendanhiggins@google.com>
References: <20181016235120.138227-1-brendanhiggins@google.com>
Message-ID: <42737f55-0d42-dffe-7b34-e24666e713a0@infradead.org>

On 10/16/18 4:50 PM, Brendan Higgins wrote:
> This patch set proposes KUnit, a lightweight unit testing and mocking
> framework for the Linux kernel.

Hi,

Just a general comment:

Documentation/process/submitting-patches.rst says:
<<Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour.>>

That also means saying things like:
... test: add
instead of ... test: added
and "enable" instead of "enabled"
and "improve" instead of "improved"
and "implement" instead of "implemented".



thanks.
-- 
~Randy

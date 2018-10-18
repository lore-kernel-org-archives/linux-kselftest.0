From: brendanhiggins at google.com (Brendan Higgins)
Date: Wed, 17 Oct 2018 19:05:49 -0700
Subject: [RFC v1 00/31] kunit: Introducing KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <42737f55-0d42-dffe-7b34-e24666e713a0@infradead.org>
References: <20181016235120.138227-1-brendanhiggins@google.com>
 <42737f55-0d42-dffe-7b34-e24666e713a0@infradead.org>
Message-ID: <CAFd5g440GaxOzii9pXF6ykmeT3ihUFduG8EpbRXCMpTLROPhtQ@mail.gmail.com>

On Wed, Oct 17, 2018 at 4:12 PM Randy Dunlap <rdunlap at infradead.org> wrote:
>
> On 10/16/18 4:50 PM, Brendan Higgins wrote:
> > This patch set proposes KUnit, a lightweight unit testing and mocking
> > framework for the Linux kernel.
>
> Hi,
>
> Just a general comment:
>
> Documentation/process/submitting-patches.rst says:
> <<Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
> instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
> to do frotz", as if you are giving orders to the codebase to change
> its behaviour.>>
>

Thanks! I will fix this in the next revision.

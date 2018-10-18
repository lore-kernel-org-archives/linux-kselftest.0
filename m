From: brendanhiggins@google.com (Brendan Higgins)
Date: Wed, 17 Oct 2018 19:05:49 -0700
Subject: [RFC v1 00/31] kunit: Introducing KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <42737f55-0d42-dffe-7b34-e24666e713a0@infradead.org>
References: <20181016235120.138227-1-brendanhiggins@google.com>
 <42737f55-0d42-dffe-7b34-e24666e713a0@infradead.org>
Message-ID:
 <CAFd5g440GaxOzii9pXF6ykmeT3ihUFduG8EpbRXCMpTLROPhtQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181018020549.RKTT5tY_PfkJ4J9Zf3WGsegqxhMC11QGssgZSO72j2c@z>

On Wed, Oct 17, 2018@4:12 PM Randy Dunlap <rdunlap@infradead.org> wrote:
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

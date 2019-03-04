From: brendanhiggins@google.com (Brendan Higgins)
Date: Mon, 4 Mar 2019 15:01:55 -0800
Subject: [RFC v4 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
In-Reply-To: <20190214213729.21702-1-brendanhiggins@google.com>
References: <20190214213729.21702-1-brendanhiggins@google.com>
Message-ID:
 <CAFd5g45F3YUsAjse+Vt5hj5CLjaXrRWgr5zCZZ6CJKc0hboP6Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190304230155.htKOqM2YlixrT66Iyjx7dFNptJOjzs3IxyjK0DCwGeo@z>

On Thu, Feb 14, 2019 at 1:38 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> This patch set proposes KUnit, a lightweight unit testing and mocking
> framework for the Linux kernel.
>

<snip>

> ## More information on KUnit
>
> There is a bunch of documentation near the end of this patch set that
> describes how to use KUnit and best practices for writing unit tests.
> For convenience I am hosting the compiled docs here:
> https://google.github.io/kunit-docs/third_party/kernel/docs/
> Additionally for convenience, I have applied these patches to a branch:
> https://kunit.googlesource.com/linux/+/kunit/rfc/5.0-rc5/v4
> The repo may be cloned with:
> git clone https://kunit.googlesource.com/linux
> This patchset is on the kunit/rfc/5.0-rc5/v4 branch.
>
> ## Changes Since Last Version
>
>  - Got KUnit working on (hypothetically) all architectures (tested on
>    x86), as per Rob's (and other's) request
>  - Punting all KUnit features/patches depending on UML for now.
>  - Broke out UML specific support into arch/um/* as per "[RFC v3 01/19]
>    kunit: test: add KUnit test runner core", as requested by Luis.
>  - Added support to kunit_tool to allow it to build kernels in external
>    directories, as suggested by Kieran.
>  - Added a UML defconfig, and a config fragment for KUnit as suggested
>    by Kieran and Luis.
>  - Cleaned up, and reformatted a bunch of stuff.
>
> --
> 2.21.0.rc0.258.g878e2cd30e-goog
>

Someone suggested I should send the next revision out as "PATCH"
instead of "RFC" since there seems to be general consensus about
everything at a high level, with a couple exceptions.

At this time I am planning on sending the next revision out as "[PATCH
v1 00/NN] kunit: introduce KUnit, the Linux kernel unit testing
framework". Initially I wasn't sure if the next revision should be
"[PATCH v1 ...]" or "[PATCH v5 ...]". Please let me know if you have a
strong objection to the former.

In the next revision, I will be dropping the last two of three patches
for the DT unit tests as there doesn't seem to be enough features
currently available to justify the heavy refactoring I did; however, I
will still include the patch that just converts everything over to
KUnit without restructuring the test cases:
https://lkml.org/lkml/2019/2/14/1133

I should have the next revision out in a week or so.

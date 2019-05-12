From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Sun, 12 May 2019 21:23:50 +0900
Subject: Build-time tests?
In-Reply-To: <20190508191341.GA17963@redhat.com>
References: <20190508191341.GA17963@redhat.com>
Message-ID:
 <CAK7LNASJr8CSWo-yE-YBq085Y=k+x8X-gQopJLRkxTueP4LGmw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190512122350.u0npAQxbMVZD3Cy0KcqV_xwHZsfdyn5Dgjki_GJSfa0@z>

On Thu, May 9, 2019@4:30 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:
>
> Hello kbuild, kselftest,
>
> I've been working on a patchset which adds an additional build script to
> the toolchain when compiling livepatches.  There are a few kernel
> section features in which this script does not yet support, but can
> detect and abort when it encounters.  To test this detection, I've
> written a small set of kernel modules that require such sections.
>
> A few questions:
>
> Is build-testing out of scope for kernel selftests?  For expediency,
> it was really easy to spin out new lib/livepatch kernel modules.
>
> Does kbuild support the notion of expected failure?  In this case, the
> build script returns a non-zero error and the build stops.


If I understood correctly, your are asking about kselftest,
maintained by Shuah Khan.

(Unfortunately), makefiles under tools/ adopted completely
different build system, and it is out of scope of kbuild.


> Am I trying to fit a square peg in a round hole?  I could easily keep
> these build tests in a private branch, but could they exist in a
> different format somewhere else in the tree?
>
> Suggestions welcome,
>
> -- Joe



-- 
Best Regards
Masahiro Yamada

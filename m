From: daniel.diaz@linaro.org (=?UTF-8?B?RGFuaWVsIETDrWF6?=)
Date: Mon, 28 Jan 2019 11:01:33 -0600
Subject: [PATCH 1/4] selftests: lib: allow to override CC in the top-level
 Makefile
In-Reply-To: <4a5fc384-ee96-54ba-02f5-fc5ab7c79c47@kernel.org>
References: <20190116174320.14938-1-daniel.diaz@linaro.org>
 <7d75f420-d624-d53d-4fa1-3827c90fa608@kernel.org>
 <CAEUSe7_eYmMSovO4JAabh+83CtY2L8eeMoCVKKS5P-fs7zVhjg@mail.gmail.com>
 <a68c3fdd-081a-74ea-8d98-30eaf3d70446@kernel.org>
 <20190128154242.GB15002@beryl>
 <4a5fc384-ee96-54ba-02f5-fc5ab7c79c47@kernel.org>
Message-ID:
 <CAEUSe799jd1vpUUfzpMMs9HXNUPpB1Jy5w1hZBd7f5CRMqLygw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190128170133.7WuVnuH3-xTTKn0PzxDP2geYG-nIWF3MQHSIVe3KyWQ@z>

Hello!

On Mon, 28 Jan 2019@10:28, shuah <shuah@kernel.org> wrote:
> On 1/28/19 8:42 AM, Denys Dmytriyenko wrote:
> > On Mon, Jan 28, 2019@08:01:15AM -0700, shuah wrote:
> >> Hi Daniel,
> >>
> >> On 1/18/19 10:54 AM, Daniel Díaz wrote:
> >>> Hello!
> >>>
> >>> On Wed, 16 Jan 2019@15:56, shuah <shuah@kernel.org> wrote:
> >>>>
> >>>> On 1/16/19 10:43 AM, Daniel Díaz wrote:
> >>>>> From: Fathi Boudra <fathi.boudra at linaro.org>
>
> This is the problem. It says, it came from Fathi Boudra
> <fathi.boudra at linaro.org>

Denys, apologies for sending this patch as Fathi's. In our Git
repository [1] he's marked as author, probably as it got copied from
repo to repo.

Would you mind sending this patch yourself?

Thanks and greetings!

Daniel Díaz
daniel.diaz at linaro.org

[1] https://github.com/96boards/meta-rpb/blob/master/recipes-overlayed/kselftests/files/0001-selftests-lib-allow-to-override-CC-in-the-top-level-Makefile.patch


> >>>>> Relax CC assignment to allow to override CC in the top-level Makefile.
> >>>>>
> >>>>> Signed-off-by: Denys Dmytriyenko <denys at ti.com>
> >
> > ^^^ I am the original author of the patch and this is my signed-off line.
> >
>
> thanks,
> -- Shuah

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9041373
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769593206; cv=none; b=qt2OnP1iLRaaPel+JKIAMjBOBmJftYEeg2eubDRegzrfwCJXJ7LWAdcRrzNtXgO3I6APw6WLLnB3bqnzFpJ32TufnzBeSUTgJnLRqy+LZ33Awr1dSG/6VwuQf7ZByUSLX/rXwgGCMPLVyAZY5clFjfKuVW2oLzjlu8lnxzsZVFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769593206; c=relaxed/simple;
	bh=8FAywcVwqaR6yySTpdg7lvCpc9PKJmZi+hCkUBisJxU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SpCXYTU4YlwaZhmFoG6aEAfOt79CK81qh7lhyiNFAaoOBryswtTXKQHOClOf8RbqSYTV09B5tW/RARSzptmv2VDdM3CDGT5KnH68IpbAeQHogSE34fEWLK58Vo0YuWclA/TGc/2R33HtMnSjzhzHYeOhxgTDkrcQtFNKfYLezyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d3Sy3fka; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d3Sy3fka"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB6EC2BCB2
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 09:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769593206;
	bh=8FAywcVwqaR6yySTpdg7lvCpc9PKJmZi+hCkUBisJxU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=d3Sy3fkalMhzo88v5CLr/kAV/3H9qy4BGNAa0y4vi/d46usjDKen/jR6KhvvoZ622
	 /wRLOxkgNe65hjeDol5SqxfZhU9ihhGU0yVfyNU139c2Oo3de0gqgC1HPc+V4oGNNf
	 KrRiZZNZQiP+KsfiE2DHNTr2sH8kdy4HFonCkQx4DzMt3dfnOlFivglzj60lilZvBF
	 7l3XMERusV7C6hrIQeZH3ByiGqm8sUicKLSGTBCEcDP/Q6F58pWQTAttih1L8596V8
	 sZiGah7cuxnBoriLDrJXWBEeG7ZaFtKoP/RmIUn8jGIALoPysRGvevQ+oFn8RlW+KW
	 wyBrPUzrbVd9A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59dd22b9895so876324e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 01:40:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjzP7MOL0o4OP8KGFLe9VxgA+Ll8yag1TgtKf3hzWfgMWhoRWe2bjYBZ/moNQQD3WwpLctLDJgz/KVz3FuRLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLRz1hztdt8u/XPVNbaTkwaLbIpOJmFI0tm0HBz3nPRlmf8N42
	dTw9aWv/CTpIbBzkQyFSptPrzE+hZ/0BVaq6uyR7rJmMHDPHyAwLq4KWYlebjoDErpV/ncoRFAP
	meNu1wtBOiNs68STv2AH1cKusUBZnL0tllwMVYPUGog==
X-Received: by 2002:a05:6512:3ca8:b0:59e:a46:ebdf with SMTP id
 2adb3069b0e04-59e0a46ed1dmr387776e87.11.1769593204724; Wed, 28 Jan 2026
 01:40:04 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 01:40:02 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 01:40:02 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260127235232.GS1134360@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124170535.11756-1-johan@kernel.org> <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh> <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com> <20260127235232.GS1134360@nvidia.com>
Date: Wed, 28 Jan 2026 01:40:02 -0800
X-Gmail-Original-Message-ID: <CAMRc=MfP1_fH91AVjerbnwVfhA0oqBKV+CTX0_1n32g1t-Pvuw@mail.gmail.com>
X-Gm-Features: AZwV_QgQPyhxTjguD36n-D-3KzP9JI7pQykXZNXE0y0Nvldh9Ywex4wJRJirHxk
Message-ID: <CAMRc=MfP1_fH91AVjerbnwVfhA0oqBKV+CTX0_1n32g1t-Pvuw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Jan 2026 00:52:32 +0100, Jason Gunthorpe <jgg@nvidia.com> said:
> On Tue, Jan 27, 2026 at 10:18:27PM +0100, Bartosz Golaszewski wrote:
>> maintainers to settle an important question. It seems there are two
>> camps in this discussion: one whose perception of the problem is
>> limited to character devices being referenced from user-space at the
>> time of the driver unbind (favoring fixing the issues at the vfs
>> level) and another extending the problem to any driver unbinding where
>> we cannot ensure a proper ordering of the teardown (for whatever
>> reason:
>
> I don't think you can defend any position where the user can do
>
>   echo XYZ > /sys/.../YY
>
> and the kernel has an oops.
>
> Meaing in this discussion if the user does
>    echo ".." > /sys/bus/XX/drivers/YY/unbind
>
> The kernel shouldn't oops or warn.
>
> I've seen many kinds of bogus arguments over the years (especially
> misunderstanding what the module refcount does!!), but ultimately I
> think this is the generally agreed expectation.
>
> However, in practice this isn't a common work flow, it is quite alot
> of tricky work to understand how a subsystem works and put in the
> necessary protections, and frankly many subsystems have had these bugs
> for their entire existance. It isn't urgent.
>

In general, that's true. However I have first bumped into this can of worms
at work when a client's custom device using a USB-to-I2C adapter and creating
devices dynamically from user-space would crash the kernel or freeze a thread
when the device would be disconnected with processes still referencing file
descriptors. It may not be common but I hope we do care about corner-cases
too.

So I'd say: it's fine as is until it isn't. :)

> Several subsystems do get it right, it is very possible and the best
> practices are much more aligned with the Device<Bound> stuff in
> Rust. ie guarantee in most contexts that remove() can't run.
>
> I'm not surprised to hear pushback on trying to fix it, especially if
> the proposed fixes are not subsystem comphrenesive in
> nature. Sprinkling SRCU around as partial patches, especially in
> drivers, is not a good idea, IMHO.
>

For sure. I've been trying to address it exclusively in subsystem code, where
this kind of logic belongs. After all, subsystem code is where we do complex
things to make drivers simpler. One exception is I2C where the logic is so
broken we need to first rework a lot of drivers. Wolfram is on board with that
though.

> The reason cdev keeps coming up is because there are few common ways a
> typical driver can actually generate concurrent operations during and
> after remove that would be problematic.
>
> File descriptors, subsystem callbacks, work queues, timers,
> interrupts, and notifiers.
>
> The latter already have robust schemes to help the driver shutdown and
> end the concurrent operations. ie cancel_work_sync(),
> del_timer_sync(), free_irq(), and *notifier_unregister().
>
> Many wrappered file descriptors are safe. For example the sysfs usage
> in a driver is sync stopped during device_del's calls to sysfs remove
> functions.
>
> IMHO the largest systemic issue in this space is people making their
> own fops without understanding the lifecycle model and without
> hand-rolling a special a "_sync" kind of shutdown around it.
>
> A managed fops with a sync destruction operation would go a long way
> to closing these issues.
>
> ie the gpiolib example was basically all fops, one work and a bunch of
> places where the protection was redundant.
>
> Yes there are other cases, and certainly I've commonly seen cases of
> drivers reaching into other drivers, and subsystem non-file ops, but
> these cases usualy have other more fundamental issues with remove
> races :(
>
> So I would probably also take a strong position that introducing
> something like DevRes where you try to wrapper MMIO or other device
> resources is adamently not something we want to do. Not because I
> don't care about these removal races, but because I want the drivers
> to run in a Device<Bound> context with very few exceptions.
>
> Jason
>

Rust makes it very clear who owns what. That's something that we struggle
a lot with in C, where we have drivers that create objects and then pass
them on to the subsystem for management but the latter still references
objects that are destroyed when the driver is unbound. Devres when used
right is great and the lifetime is very clear: from binding to unbinding.
The using right is the hard part though. :)

Bartosz

Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C563115B5;
	Thu, 29 Jan 2026 01:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769648909; cv=none; b=JF8GcXAMnsYYMomN+djjNb/POK2sjHAt6GVx6C0g9uZCgv0h78q6k+h0pSpCX4yiUUJGbzkNhK2XO3o37+NdDl5o8W07Hy8JW+YG6bgamEiSnxVrHvU+3DURK7clHx2eEaABj1GMnUvmq4U3BSxoCbsQx3VTKnhrTAi2ry1bWhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769648909; c=relaxed/simple;
	bh=NmMIjnc1w/Lz1Dz85O+qPACEzwwN1RiLxmOqeaOsQoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWyawulKZKyqStEAUujetQRqLAgEiULnXQM5Fm/4vy0C39NICgejOccqlrulDzZnMWklrFMoW0prn3M9IyzdRN+Zb3VnTkIjyqn8aw4ImGq8OUBzWyMF36D4EWJ1MK2k68sjfXSjTF8dT/458201zQS7es4HxUVG2RGJEIe/I7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bULjRZgv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bULjRZgv"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D94816A6;
	Thu, 29 Jan 2026 02:07:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769648867;
	bh=NmMIjnc1w/Lz1Dz85O+qPACEzwwN1RiLxmOqeaOsQoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bULjRZgv6+0lT3/djpYduvFtSt15BPW8LdTxm7HNxwYXOOIliXzkPIlU/qWUEIzAN
	 QBCb384LhugC8P0g9O6MtvydGgAP7fHGHcdLwK2juP0xZpEpfQcZHFYctcflKrTYbf
	 l0l9AUZFJaZyE2v7WUZE22XmHIDApLIn9IHilcsA=
Date: Thu, 29 Jan 2026 03:08:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260129010822.GA3310904@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127235232.GS1134360@nvidia.com>

On Tue, Jan 27, 2026 at 07:52:32PM -0400, Jason Gunthorpe wrote:
> On Tue, Jan 27, 2026 at 10:18:27PM +0100, Bartosz Golaszewski wrote:
> > maintainers to settle an important question. It seems there are two
> > camps in this discussion: one whose perception of the problem is
> > limited to character devices being referenced from user-space at the
> > time of the driver unbind (favoring fixing the issues at the vfs
> > level) and another extending the problem to any driver unbinding where
> > we cannot ensure a proper ordering of the teardown (for whatever
> > reason: 
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

I completely agree with this approach. I don't think anyone really
advocates for considering that causing an oops from userspace is a
normal behaviour. While the various discussions on this topic that
escalated into heated arguments over time may have created an impression
that we have two camps, I think we are all fundamentally in the same
camp: we want to kernel to run reliably without crashing, with
performant technical solutions. And let's remember that we achieve this
goal best when we work together.

> Several subsystems do get it right, it is very possible and the best
> practices are much more aligned with the Device<Bound> stuff in
> Rust. ie guarantee in most contexts that remove() can't run.
> 
> I'm not surprised to hear pushback on trying to fix it, especially if
> the proposed fixes are not subsystem comphrenesive in
> nature. Sprinkling SRCU around as partial patches, especially in
> drivers, is not a good idea, IMHO.
> 
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

One a side note, devm_request_irq() is another of the devm_* helpers
that cause race conditions, as interrupt handlers can run right after
.remove() returns, which drivers will most likely not handle correctly.

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

That's what I've been advocating for. The best way to ensure that driver
code will not accessed data freed at .remove() time is to prevent the
code to run at all.

We have different classes of problems. It's tempting to think that a
single solution can handle them all, but that's often not the best
option. Based on what I've seen so far, handling the fops vs. .remove()
race is best done by ensuring that fops do not race with .remove(). Dan
Williams showed that it can be done quite simply. Conceptually speaking
(not using (S)RCU or other specific kernel primitives, to try and
describe the concepts clearly), it works as follows.

1. At the beginning of .remove(), flag that the device is being removed.

2. At the entry point of all fops, check the flag and return with an
   error if set. This prevents *new* fops from being entered once
   .remove() has started.

3. At the entry point of all fops, flag that a fop is in progress (with
   a counter).

4. In .remove(), wake up all threads sleeping in fops.

5. At the exit point of all fops, decrease the fop-in-progress counter.

6. In .remove(), wait until the fop-in-progress counter reaches 0. At
   that point, it is guaranteed that all fops will have completed and
   that no new fop can run.

7. Complete .remove(), freeing resources.

Most of this of course would need to be handled in helpers at the cdev
level, and wrapped in subsystem helpers. Drivers will need to be
modified to

- Call a helper at the beginning of .remove() to handle (1).

- Wake up threads sleeping in fops (3), as only drivers know about these
  (in the general case, in some subsystems this may be handled in
  helpers).

- Call a helper to handle (6).

The only fop that this doesn't handle is .release(), as we can't block
.remove() until userspace closes all open file descriptors and unmaps
all memory. This is also the race condition that is the easiest to
trigger (along with the race conditions related to threads sleeping in
fops).

Solving the .release() race also requires driver involvement too. By
definition drivers have tasks to perform in .release() that need to
access resources (MMIO, data structures, ...) - otherwise there would be
no .release() operation. Drivers need to synchronize between .remove()
and .release() and skip release tasks that have been performed by
.remove() already. Strategy depends on subsystems, in the V4L2 case
things can be more complex as it's common for drivers to create multiple
cdevs, but it's entirely maangeable with clear concepts that can be
documented, implemented, and checked during review.

> ie the gpiolib example was basically all fops, one work and a bunch of
> places where the protection was redundant.
> 
> Yes there are other cases, and certainly I've commonly seen cases of
> drivers reaching into other drivers, and subsystem non-file ops, but
> these cases usualy have other more fundamental issues with remove
> races :(

Drivers using resources provided by other drivers is a more complex
problem. I'm thinking about a driver acquiring a GPIO in .probe(), and
the GPIO provider disappearing at a random point of time. Or a clock, or
a regulator. These issues are more rare if we ignore unbinding drivers
forcefully through sysfs, but they can still occur, so we should try to
find a solution here too (and the sysfs unbind issue is also worth
fixing). There, unlike in the cdev case, some sort of revocable API
could make sense.

> So I would probably also take a strong position that introducing
> something like DevRes where you try to wrapper MMIO or other device
> resources is adamently not something we want to do. Not because I
> don't care about these removal races, but because I want the drivers
> to run in a Device<Bound> context with very few exceptions.

-- 
Regards,

Laurent Pinchart

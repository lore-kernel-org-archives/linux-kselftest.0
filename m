Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894387;
	b=VbdnhbHTWsMH3hYGi7rJLyTHJrA8DU0/VKRMmVbLUlViGjhtHWSvUZhOZ0A/1Xozv9v1
	 CUY5Vk/9xKo5o3BBJ+8wSY1aSDpWWedCWJ0LoBOotrHxo50f5gjZ4klN+aXzLydNtXWYX
	 SDJFw2HBX18KKbmq6suiwwVyY5Tc4UkOOsWo6RKt9MoHbibXoAv2uBCs8LOu8Z0oUeDjx
	 QzWhLXitP23zO2GTqABoHQqtyOR81beAYzYMP03bnh7dHKBQhaIlueA+XHKPMeOLPS7/j
	 5Hl66car0burypeDuiWFOJWWJe8SiLF5fBNJT/3N3se8f9eeaPOwInZ7fgDaEnlKVAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SyweY0UXz6hh0hI/nESUYL8IRVfask0csXM9VevHXJw=;
	b=fCKczUrHCcPBuDdNOEDNq91s1HyyrHYgjkIxnNk1YS1GDD8N+xA5js++g1EbC8I19Hvw
	 eEMVFMJ8XmJdH7CYlxe6IplYRDNhEHLCEvVLn1N4TedHQbU585E2E1KcVe8WlE+uk2Kzi
	 zIyazi6pjGEG34pD4ULJ8ArmdbHJvrsW31KOtaW0khvQNi5+0sCZ3Zjl2QnCwfQoE43tl
	 OonhDPlNMrzw/9Hx563GksMz/M4a0fSgtOzQjPjk4mbkkFIyxBW5oq/VjzsI2gn0E/YZW
	 k6LhEXoVjwV0SXEOSE8hMSkhVDZBXrYmL6Vg4qfZulaNRmemXTO99m/P+afVmFCcilw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=imh3HM7u;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048FB606A60B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 15:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 048FB606A60B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=imh3HM7u
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so1218286241.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 07:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793894386; x=1794499186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SyweY0UXz6hh0hI/nESUYL8IRVfask0csXM9VevHXJw=;
        b=imh3HM7uPpU/TSgpgy9tuGDfsT3kYPBMMDlqwUxIWR9eni6++YnmIn/DFaEGnaw6Dr
         +nWZ4e9BcKaqrBG0RmBswk3iRHUnqLWWrADqGFso0TxcbQ1KdBvxxUF+siqurSVI4Yrf
         BSz7ljqX0zkXncPcJgaHGMZ+OJ23cm4EEtj9KPVq7qB4frJ36YWuBBHG0wdJnVCpfH/K
         L9No9V1wjswYmImK37+33bhDghJ8Wn3pZ2G7zh0kVua0SzhC4xUUvFZLkX+l6ChWDRb5
         GhHADEPHBC6EWB62YFZ2bRuOVzR7/gwYMGmrawc407G4qZgEI7be0Lq9nOnreJdYyw7o
         TLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894386; x=1794499186;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SyweY0UXz6hh0hI/nESUYL8IRVfask0csXM9VevHXJw=;
        b=zPsfYWristTpHf8SlQEu17gDo5BkDucAVARwYUt9CY0EpVGwNqngQqw//VSozC/S8G
         n5bRYeMxP8VUAyGyl8AClRue9VxW/CqlODHuDZ66zz47mU85pNU8MA52TVaCgBlFo5P/
         ZYma0O4bjDnQ3/aNW/VA6ac2lWCFBO22NAOkgG2ossGcpoHbRUYROUAO+qDBvHHOC/Qv
         QnlUzknRWAmIbK8H5EEDGSR1baX6+P91Tu9IDnw8lcChYxUQhGYXgqhPgjP7gINFNmdb
         dp4G3h6DnzqTDtc8q072Gr6U4/skRJi7DdIjQ9mLQ5h09uzqpbd0ZNztVcyCdy7zdfym
         5sbA==
X-Forwarded-Encrypted: i=1; AKwUvBwgk4nqQHJTGZmDwZY8Z5/5qFCskTaZnD9HWW/I1q5WzhEe4aR7HRNBWVRpu1Ss3uvA7g8KPh3UyKa5OP9Dc2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z9oqXk01w3E/2LZg34zsmMBGRbwfVUjCL7Te3l1aHQEm5Nsp0
	ffv/H1JS6zEHimXp8daBPXK1ifqyyzk6oa7xocWF3Yo6RqtEqwmG5n/qlo3T+TeTHbg=
X-Gm-Gg: AYBFou05X68ZOt8VO9uw+56G7bTqx7SlUDoBxxj4pSei8dyx1IdNJrddkqzbfVghQAT
	pmrkQ+FqUEfNF8wR51v+J2THQNE75KVH/mhrhVS/S1pLs0WFSzPYWbBQ0IOQmOwcpdJbThaxwNE
	gNGZlY4Lt2tlTGD+Lb557gR6Rv0EOBG2aMUDHKxPakHFTGlwWrpa0qe8pXHUNqa+ll1Eja4BDY1
	P1HPIiEkJrrFzDegNy/30EFQWw9rbvw+o43i6XyjEdrqBeYta6HHM7JjiihA7K8OrKGGeMplDwS
	auIoKe/BYkniEbelcIQzO8FWgDLQ3YTvhYNQfJZMoBgsA0kutodJkhey5m5IG7S2W/ioN/LvL8W
	EJi58eug0Ty/WBTYTOHvJT/0X5lGGrDAKO86ewp15lYNqJ9g1PZljAdkG7fHjcXu0/VT8rjnjIt
	I7ip/bqUKuWbDma1u+5iQ0Mf78XbadxeYr55o/6tMEfMy0rY2WJFEfveGY/ZLJZ5UcYuKlLj7ev
	YwG21UpJdMPJsx2VtiwZgV0nTq2xHVl3Frsvq6VDipLQx92O29rYGdmknBxTfzKDmqPUvbk3vUO
	WSZplNF+mOS/YuhftdtXttj17ENpSqOlXBnnm9+DO3yQv/qm+jlJwWUiIwA0TREWEA==
X-Received: by 2002:a67:e11a:0:b0:7cc:2c52:47aa with SMTP id ada2fe7eead31-7d2a0f73864mr14699137.0.1793894385884;
        Thu, 05 Nov 2026 07:59:45 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d296415719sm1096670137.8.2026.11.05.07.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:59:45 -0800 (PST)
Date: Thu, 05 Nov 2026 15:59:44 +0000
Message-ID: <499ba73b1a72a30c6118a4f693f8fc5b.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>,
 Eric Dumazet <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>,
 Jan Kara <jack@suse.cz>, Takashi Iwai <tiwai@suse.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-raid@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RESEND v2 0/7] proc: move procfs to what kernfs does
In-Reply-To: <20261104-work-procfs-v2-0-b45cd5789ac5@brauner>
References: <20261104-work-procfs-v2-0-b45cd5789ac5@brauner>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hey Christian,

This is a summary of my Claude review of v2.  v2 went out before my mail
on the RFC [1] did, so the first part is what's left of that one with
the new patch numbers and the second part is what's new in v2.  What
says "run" was run in a VM on top of v2, the rest is from reading the
code.

3 (selftests Makefile), 4 (pde_seq_next()), 5 (sysctl readdir ending
early) and the allocinfo deadlock from that mail are gone in v2.  These
still apply:

- 1 is bugfixes 32/51 ("proc: resume readdir after the last name it
  returned") now and the patch is unchanged.  Run again, readdir(2)
  still returns 1 without a dirent at the end of /proc/fs, bus, driver,
  irq, tty, net and self/net, for all of the 100000 calls.

- 2 is cleanup 5/6 ("proc: drop the _buf suffix from the new methods")
  now.  Run again, the module with .proc_read = seq_read builds without
  a warning with W=1, loads without a warning, and every read() fails
  with -EFAULT.  There's still nothing in porting.rst.

- 6 is bugfixes 47/51, 48/51 and 50/51 now.  47/51 has no Fixes: or
  stable tag, 48/51 is tagged for stable and git apply takes it on top
  of 46/51 with two hunks offset by 6 lines.  50/51 has the same Fixes:
  7e0e953bb0cf.

- All of the smaller stuff.  The cursor is allocated in one place since
  core 03/23 and it's still GFP_KERNEL, copy_to_user_fromio() loses its
  last caller in drivers 24/26, the sentence about ntfs_set_label() is
  in fs 07/30, and snd_info_text_entry_write() still drops what was
  written before it grows the buffer.

New in v2:

1) bugfixes 01/51 ("alloc_tag: don't remove /proc/allocinfo under the
   codetag module lock")

shutdown_mem_profiling_async() is defined outside of #ifdef
CONFIG_MODULES and its three callers are inside of it.  Run with
CONFIG_MODULES=n, CONFIG_MEM_ALLOC_PROFILING=y and CONFIG_WERROR=y,
v7.4-rc1 builds mm/alloc_tag.o and with 01/51 it's

	mm/alloc_tag.c:620:13: error: 'shutdown_mem_profiling_async' defined but not used [-Werror=unused-function]

This one is tagged for stable.

2) drivers 07/26 ("md: let procfs own the wait queue of /proc/mdstat")

md_exit() used to remove /proc/mdstat first, which waited for the
readers.  It now does that after destroy_workqueue(md_misc_wq), so that
nothing can reach proc_poll_notify() on a removed entry.  But a reader
can be in here while md_exit() runs:

	mddev = list_entry(v, struct mddev, all_mddevs);
	if (!mddev_get(mddev))
		return 0;

	spin_unlock(&all_mddevs_lock);
	...
	spin_lock(&all_mddevs_lock);
	...
	mddev_put_locked(mddev);

md_exit() clears the array, but its mddev_put_locked() isn't the last
one anymore, so nothing gets queued and destroy_workqueue() has nothing
to wait for.  The reader's put is the last one and ends up in

	queue_work(md_misc_wq, &mddev->del_work);

on the destroyed workqueue.  It takes an rmmod with an inactive array
left over and somebody reading /proc/mdstat, and this wasn't run.

The two orders each fix one side.  If proc_poll_notify() was safe to
call on an entry that's been removed the removal could stay where it
was.

3) core 21/23 ("proc: let lockdep check the pin")

The class is keyed on the proc_ops, and every ALSA text entry uses
snd_info_text_entry_ops, so they're all one class.  Run with
PROVE_LOCKING and snd-dummy built in, cat /proc/asound/pcm and then
unbind snd_dummy.0:

	WARNING: possible circular locking dependency detected
	init/1 is trying to acquire lock:
	 (pde->in_use){++++}-{0:0}, at: __remove_proc_subtree
	but task is already holding lock:
	 (register_mutex#3){+.+.}-{4:4}, at: snd_pcm_dev_disconnect

	-> #1 (register_mutex#3){+.+.}-{4:4}:
	       snd_pcm_proc_read
	       snd_info_seq_show
	       seq_read_iter

	-> #0 (pde->in_use){++++}-{0:0}:
	       proc_entry_rundown
	       __remove_proc_subtree
	       snd_info_disconnect_entry
	       snd_pcm_dev_disconnect

snd_pcm_proc_read() is the only proc callback that takes register_mutex
and it only serves /proc/asound/pcm.  What snd_pcm_dev_disconnect()
removes under the mutex is pcmNp and pcmNc, and nothing below those
takes it.  So it's a false positive, and it turns lockdep off for
whoever unplugs a sound card.  The removal under register_mutex is
already there at your base, only the annotation is new.

proc_create_single_data() gets a key per registration site, but there's
no way for a proc_create_data() user that multiplexes callbacks behind
one proc_ops to say so.  sysfs has the per attribute key and
ignore_lockdep for this.

4) core 20/23 ("selftests/proc: check that a mapped entry can be
   removed")

The core cover letter says this one "fails without the mmap patch and
passes with it".  Run against a virtio-rng device, it passes on core
18/23, which has no proc_vm_ops in System.map, and it passes on the
whole series.  The test checks that the removal doesn't wait, that the
entry is gone and that pread() fails with -EIO, and it doesn't touch the
mapping after the removal, so none of the new wrappers run on a removed
entry.  These kernels had neither KASAN nor lockdep, so if what fails
for you is a splat then that's the difference, but the test itself
doesn't notice.

5) core 18/23 ("proc: let procfs copy ioctl arguments in and out")

No Signed-off-by in the mail.  It's the only one of the 172, and the RFC
version had it.

Smaller stuff:

- The 0/7 mail still says "the xt_recent deadlock fixed in (1) below".
  The part 1 cover letter has it right, it goes through netfilter now.

- cleanup 03/06 says mmap() and write() are all that changes for kcore,
  kmsg and the kpage files.  proc_reg_poll() answered for every regular
  file, and kcore_fops and the three kpage ones have no ->poll(), so
  EPOLL_CTL_ADD on them goes from working to -EPERM.  I doubt anybody
  cares, it's only the changelog.

One more old one for part 1, and this is the lockdep patch doing its
job.  devm_rtc_unregister_device() holds rtc->ops_lock over
rtc_proc_del_device(), and rtc_proc_show() -> rtc_read_time() takes
ops_lock while it's pinned.  Run with PROVE_LOCKING and rtc-test as
rtc0, cat /proc/driver/rtc and then unbind rtc-test.0:

	WARNING: possible circular locking dependency detected
	init/1 is trying to acquire lock:
	 (pde->in_use){++++}-{0:0}, at: remove_proc_entry
	but task is already holding lock:
	 (&rtc->ops_lock){+.+.}-{4:4}, at: devm_rtc_unregister_device

	-> #1 (&rtc->ops_lock){+.+.}-{4:4}:
	       rtc_read_time
	       rtc_proc_show
	       seq_read_iter

That one is the same entry on both sides, so it's real.
rtc_read_time() uses mutex_lock_interruptible(), so a signal to the
reader gets both of them out of it.

The end state still checks out.  Every proc_ops initializer matches the
final struct, nothing copies to or from userspace while pinned, and it
didn't find anything wrong with the new seq_file, open node, poll or
vm_ops code itself.

[1] https://lore.kernel.org/r/464ef986eab97abf226791c7e19ad111.josef@toxicpanda.com

Thanks,
Josef

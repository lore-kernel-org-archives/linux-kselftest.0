Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AA935DCE6;
	Tue, 27 Jan 2026 15:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529469; cv=none; b=pJd7RQoSXv2XiCUPiaj+g5X/Wzq3FuShBmk/LoP4T5nnQxZ3NTM9PeR/3ckRR3RCtYNZh0XzGKG2abkz8D/KV0XB/nbRR9IKDSs0NtSnbpAC+JSaQCAMwomFoS0YiQNf+3Eo1XDPSiMWdLuiPSCp0gmbepZLFCMP0Urlf/dhf4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529469; c=relaxed/simple;
	bh=YUJDTaMgr4B1s+oKdn5bEkdHuVjvL/H15gNn8NfFlFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9EwMjbxnf2JBlhk++9IsrIy72ZLA5DCDJrQ/UDVL3g1yAVya+vFLSR/Y4FDrS99bLvDvLGcTm7XZe6uDMU8PNMIN3aoriHlzvmPbx6yN2FFUcA2U6LSu8abHaYHwpYEsyrGPX49efsYRWuSSfmFVUs36WWafV3zRTRxCAiDECE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCUlt7I0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCUlt7I0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69AFC116C6;
	Tue, 27 Jan 2026 15:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769529469;
	bh=YUJDTaMgr4B1s+oKdn5bEkdHuVjvL/H15gNn8NfFlFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PCUlt7I0Vkad1WwItCieNR87h+ZBUJyPGYiDHIv26zHMqCC0jmc+5FlRTWI88JQVr
	 KB/PAJN4VXgtw6rEpl+KYSWmYILX2rbVIGf/uyUnKAockvNF2T5emlXrtg/akKWQ1A
	 GFQoNtz3iBD50Hqw6a8AjdThqD1i/F9ulJp4s35RELL7r39jHpzmClnqf2HqEwZUO6
	 MLveTGO8gMBHt5l/6QSRJL4YxO8PhrQNcviYo7SSeYaCuQ+jnwHa4cm3mgNPh2Q1nw
	 de/Ou3EgpvBfE3bnL+8bWi3/2eulLSp1DABdJYZOcWPs0gH5uq9Xg13JgW9jCNoFrp
	 04iKT5IsRC/zQ==
Date: Tue, 27 Jan 2026 15:57:44 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <aXjgeNY-jf9rIw09@google.com>
References: <20260124170535.11756-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124170535.11756-1-johan@kernel.org>

On Sat, Jan 24, 2026 at 06:05:32PM +0100, Johan Hovold wrote:
> I was surprised to learn that the revocable functionality was merged last week
> given the community feedback on list and at LPC, but not least since there are
> no users of it, which we are supposed to require to be able to evaluate it
> properly.
> 
> The chromeos ec driver issue which motivated this work turned out not to need
> it as was found during review. And the example gpiolib conversion was posted

Thanks for sharing your thoughts on revocable.

Regarding cros_ec_chardev, my last attempt [2] to solve its hot-plug issue by
synchronizing misc_{de,}register() with file operations using a global lock
highlighted the difficulty of alternatives: that approach serialized all file
operations and could easily lead to hung tasks if any file operation slept.
Given the drawbacks of [2], I believe cros_ec_chardev remains a valid use
case for revocable.

> the very same morning that this was merged which hardly provides enough time
> for evaluation (even if Bartosz quickly reported a performance regression).

The gpiolib conversion was provided as the first concrete user to enable
this evaluation process.  The performance regression Bartosz identified is
valuable feedback, and I believe it is addressed by [3].  I plan to send the
next version of the series after v7.0-rc1 and revisit the issue.

[3] https://lore.kernel.org/all/20260121040204.2699886-1-tzungbi@kernel.org/

> Turns out there are correctness issues with both the gpiolib conversion and
> the revocable design itself that can lead to use-after-free and hung tasks (see
> [1] and patch 3/3).

I appreciate you identifying the issues where multiple threads share a file
descriptor; this is a case I overlooked.  I see these kinds of findings as a
positive outcome of having wider review and a concrete user, allowing us to
identify and fix issues in the design.

> And as was pointed out repeatedly during review, and again at the day of the
> merge, this does not look like the right interface for the chardev unplug
> issue.

My focus has been on miscdevice [2], but I suspect cdev solutions for device
hot-plug would face similar synchronization challenges between device removal
and in-flight file operations.

> Revert the revocable implementation until a redesign has been proposed and
> evaluated properly.

I'll work on addressing the discovered issues and send follow-up fixes.  I
believe keeping the current series in linux-next would be beneficial, as it
allows for easier testing and wider evaluation by others, rather than
reverting at this stage.

> 
> Johan
> 
> 
> [1] https://lore.kernel.org/all/aXT45B6vLf9R3Pbf@hovoldconsulting.com/

---
[2]:
diff --git a/drivers/char/misc.c b/drivers/char/misc.c
...
+static struct miscdevice *find_miscdevice(int minor)
+{
+       struct miscdevice *c;
+
+       list_for_each_entry(c, &misc_list, list)
+               if (c->minor == minor)
+                       return c;
+       return NULL;
+}
+
+static __poll_t misc_sync_poll(struct file *filp, poll_table *wait)
+{
+       struct miscdevice *c;
+
+       guard(mutex)(&misc_mtx);
+       c = find_miscdevice(iminor(filp->f_inode));
+       if (!c)
+               return -ENODEV;
+       if (!c->fops->poll)
+               return 0;
+
+       return c->fops->poll(filp, wait);
+}
...
+static const struct file_operations misc_sync_fops = {
+       .poll = misc_sync_poll,
+       .read = misc_sync_read,
+       .unlocked_ioctl = misc_sync_ioctl,
+       .release = misc_sync_release,
+};
+
 static int misc_open(struct inode *inode, struct file *file)
 {
        int minor = iminor(inode);
@@ -161,6 +237,7 @@ static int misc_open(struct inode *inode, struct file *file)
        replace_fops(file, new_fops);
        if (file->f_op->open)
                err = file->f_op->open(inode, file);
+       file->f_op = &misc_sync_fops;

Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8515B3C9EE6
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Jul 2026 07:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272613; cv=none; b=GLzQamIr1xRMUMQCBk1FAqIMiYbUew+AWqui/JtqRzFTQuz3HiQvsgMwgDIx45hGd/0vjSt4byEsoprR8W/o8pjquHr0gGJD7Hg9fnFosozRdHGU+q8ZuEpeLrxxtpLvusDYoiD16Zr9t7N7OiK6WhNYpNOPmGFIi5A0yNt+Y84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272613; c=relaxed/simple;
	bh=sm7/91cqsAlwz5MSdYN8PiNKzNq6F13Lp6/BqPPrD8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOpC2paQpVLUv206tvjS5fnSZbod29UPm9DOhaJ7PeBCdcVqm1oT8R8gwmWuOzo2VBwOOqCT06flpb5Fux5MJSPQD9UNidq+EDjr71YNf5oRRYVeh7xFiKNzQY+9BbZVGMbqyoNUqIhFzVgU4ZTy9Znh1P4SH9gNgiwDw2JJihU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HZthQBFw; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HZthQBFw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784272598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ykj7j2TDvNrFWyx2wOeD7eQtBc+/mXRhuYo6V5jMIW4=;
	b=HZthQBFwTPafqA7/z8vwiqrBkzvUO6Y6RY+wDUW/8KsrKgOfmqOmtCh+mGmkMr2L4Vu/M5
	gVElcxGlKit8oIvT+BaHiUEX62Tu6aJm0C2oMC3Ndfi1kOMtncpa4xVEXsSgUwTKrLyQaa
	8jRfWaIKaro9zHCU4gTAPlMG3G069xI=
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Shuah Khan <shuah@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Alexander Graf <graf@amazon.com>,
	Kexin Liu <liukexin@kylinos.cn>,
	George Guo <guodongtai@kylinos.cn>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 1/3] LoongArch: kexec: add KHO support for FDT-based
Date: Fri, 17 Jul 2026 15:15:51 +0800
Message-ID: <20260717071551.11904-1-dongtai.guo@linux.dev>
In-Reply-To: <CAAhV-H5B6Mj2-AffkstJ4f8EEmvvPOGXoDy2QNudKD2kSz2XkA@mail.gmail.com>
References: <CAAhV-H5B6Mj2-AffkstJ4f8EEmvvPOGXoDy2QNudKD2kSz2XkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Huacai, Pratyush,

Thanks for the direction.  You were both right that the v3 approach was
the wrong shape, and I have dropped it.

Let me restate the constraint and report what I did.

> But LoongArch is different, the efistub doesn't create a FDT, instead
> it passes the EFI system table and command line to the core kernel
> directly.

So LoongArch has no boot FDT, and the arm64 /chosen path does not apply.
My v3 synthesized an FDT and rewrote the DEVICE_TREE_GUID entry only to
reuse the generic reader.  That was the hacky part, and it is gone.

I followed the x86 model instead.  x86 has no boot FDT either; it carries
the KHO pointer in setup_data (struct kho_data) and calls kho_populate()
directly.  LoongArch has no setup_data, but it does pass the EFI system
table.  So I use the EFI configuration table as the channel:

- The first kernel builds a small handover struct (the KHO FDT and
  scratch addresses), adds a dedicated GUID entry pointing to it, and
  loads both as kexec segments.  machine_kexec() switches the system
  table to the extended table before jumping.
- The next kernel scans the configuration table for that GUID, reads the
  struct, and calls kho_populate() directly.

There is no synthesized FDT, no DEVICE_TREE_GUID rewrite, and nothing on
the command line.  I did not go back to the v1 command line because that
exposes the addresses to unprivileged userspace through /proc/cmdline.

I tested this on real LoongArch hardware (ACPI/UEFI) with the live update
two-stage kexec test and the test passes:

$ sudo ./luo_kexec_simple --stage 1
# [STAGE 1] Starting pre-kexec setup...
# [STAGE 1] Creating state file for next stage (2)...
# [STAGE 1] Creating session 'test-session' and preserving memfd...
# [STAGE 1] Forking persistent child to hold sessions...
# [STAGE 1] Child PID: 1242. Resources are pinned.
# [STAGE 1] You may now perform kexec reboot.
$ sudo kexec -l /boot/vmlinuz-7.1.0-rc6 --initrd=/boot/initramfs-7.1.0-rc6.img --reuse-cmdline
$ sudo kexec -e

$ sudo ./luo_kexec_simple --stage 2
# [STAGE 2] Starting post-kexec verification...
# [STAGE 2] Retrieving session 'test-session'...
# [STAGE 2] Restoring and verifying memfd (token 0x1a)...
# [STAGE 2] Test data verified successfully.
# [STAGE 2] Finalizing test session...
# [STAGE 2] Finalizing state session...
#
--- SIMPLE KEXEC TEST PASSED ---
$ sudo dmesg | grep kexec
[    0.000000] [      T0] KHO: found kexec handover data.

I will send this as v4, folding in Mike's two selftest comments.  If you
see a problem with the EFI configuration table approach, please tell me
before I post.

Thanks,
George

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266117;
	b=f4fEL2qAwVHaPTu1PxeD4IOEAhDzvkUMhAZDYbe+GSKQ9dIitin/mx2g1X9CtGH2lren
	 wfYvlKzSWd308UvdAHTJeSqFcOdyu+Lgd0+UcDnDYX6bLe3EHDdOhfqRgbpK7w0rZgQ2B
	 KG1bTTgQYtt+rAB/BPfOzQXnw2KRmoWw3Iwkv40rS78K5A2hhJZPuXtpgOjSRqur8Duvw
	 ldRxNWJgZA0qaY2JBUgwIkUznoaId6oQDflKXfvoKEOhceOdYrXLU4z4+OF9JTBPXv5Ri
	 asXp2NCAuVHj6flq4Eq6hwjaFSRCpZ6xJ4vMkBSKWC3NeKg2tMC/VoIzXLNghISy1Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266117;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vNs8pQo9FNaEm6Q5JhAnNxFhl0Ol1mfle0Nn+E3Gwdw=;
	b=vRk3QZnxtM1HsihVzHJdYJZJivlY2of4NsC2mvLHRH4SY31vJSabM1olMZP/DUjsABZn
	 W1WyqZQGyaZIPCq/gWGs+3STcgnVbQLHsNOCkf0GdT9l+rTcAff2xysvaXqXQVzk6mNdi
	 2v4I0DXHBsDOw0SwaBxQMDcpBYOZYVEENNGxsN8V3+ZcqgCk9mmUQMQJhhChf1aQFWwPV
	 4EA8DTMQBKePnFRvPrOiCbJyzj6Lry1NdPrsLmtOfE2NRYrQ2lntczfuvQMohKMkhZ+nl
	 OUCpn2EkOvCLJW+YdeQs0mMmph/53+Zg6Ag7yO9ZD1lXnkDX2sCIf82ZcPHJbpwhZUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UxrYfoyO;
	arc=none smtp.remote-ip=95.215.58.175
Received: from mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939FF606A320
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 09:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 939FF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UxrYfoyO
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=urX40M0BeReS1VTXj5LBvDRDeFzSyp9ZwaVw7PhaWJw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793266114; v=1; x=1793870914;
 b=UxrYfoyOWu3DD5arLx5rNn9BWGGxEyRTsnXV5x8IXDigY/DfpEwJZ41nVqlUNyZPa0FbeEEv
 O9m7Yt9gFKVYX1EhnNDHaqx5yGNUkykrt6ENkKxdM+vIoWbAZrG2IIJWJiPotdeSOWv2Q3ioT9J
 plbMnvOoFZbWU9jXiSJDsLFo=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 36402ba9aa92ee46;
	Thu, 29 Oct 2026 09:28:34 +0000
X-Mizu-Trace-ID: 36402ba9aa92ee46
X-Migadu-Flow: FLOW_OUT
Message-ID: <0bc9b82b-0b38-4df3-8227-f21d6b6e959f@linux.dev>
Date: Thu, 29 Oct 2026 17:28:24 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] init: do_mounts: free the ramfs info of the boot rootfs
To: Breno Leitao <leitao@debian.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Shuah Khan <shuah@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 linux-kselftest@vger.kernel.org, kernel-team@meta.com
References: <20261016-rootfs-kill-sb-v1-1-7631af3ba35f@debian.org>
 <auBzcXQw0j4zTvTM@gmail.com>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <auBzcXQw0j4zTvTM@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/27/26 5:48 PM, Breno Leitao wrote:
> On Fri, Oct 16, 2026 at 07:27:58AM -0700, Breno Leitao wrote:
> > Kmemleak is reporting the following leak in ramfs_init_fs_context:
> >
> >   unreferenced object 0xffff000080302480 (size 8):
> >     comm "swapper/0", pid 0, jiffies 4294667306
> >     hex dump (first 8 bytes):
> >       ed 01 00 00 00 00 00 00                          ........
> >     backtrace (crc bea23b04):
> >       __kmalloc_cache_noprof+0x28c/0x5a0
> >       ramfs_init_fs_context+0x5c/0xf8
> >       rootfs_init_fs_context+0x30/0x40
> >       alloc_fs_context+0x4c0/0x6a8
> >       fs_context_for_mount+0x28/0x40
> >       vfs_kern_mount+0x40/0x220
> >       init_mount_tree+0x80/0x440
> >       mnt_init+0x138/0x170
> >       vfs_caches_init+0x2c/0x48
> >       start_kernel+0x350/0x3f8
> >
> > When init pivot_root()s away from a ramfs-backed boot rootfs and
> > unmounts it, the rootfs superblock is killed with kill_anon_super() and
> > the struct ramfs_fs_info allocated by ramfs_init_fs_context() is never
> > freed.
> >
> > Kill a ramfs-backed rootfs with ramfs_kill_sb(). A tmpfs-backed one keeps
> > kill_anon_super(), as shmem frees its info in ->put_super.
> >
> > Fixes: 576ee5dfd459 ("fs: add immutable rootfs")
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> Ping?

There is a similar fix for that.

https://lore.kernel.org/20261009055546.85279-1-kmehltretter@gmail.com

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305680;
	b=VGo1YaXPnOwIe+XI76tcEP+UBKpufmqUXEAvAlVfvT49zeGcoXvZEOK/n6Jy+3X6tDBt
	 gB/ZkzQC1ytRo+KvvNF2sMPb5MWFpiKGwP7JzdCH41djVfKGT8NcENKTc6vRUzoVFDI0R
	 n/l8UXkaeTaZKLwDVThLVa07ncSV+LccR1B2U3U2xm7Ef8ExSm6L1EZAdFlo4FYaDWZaL
	 lmXZhmFy9Z0qCxVOakBJd4bRqhUXOlnNCOOxz9XGEtp1A2ROWz22FSwnQTm7rEtGMj3hh
	 8A3cxCza/iHwV1wF/j7x3s0vFbqBdXHUK31bL/wWCrlBDN+kCA+DU3y1m+Xrer5Cvtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9WFltYRvNkpM0HMxRLJxGiCTEiP83WtKPHu+oXy3KTg=;
	b=PMiUAsi/j+OlIvl2JU5I44KZ+iGxzNJI4QVyxTDVTtvK815nhqFVXuSc4PncYtg9GbE+
	 oQu9HBU1XnwsUsbeURaBxVLGwG0xCAmMp8sux2AK0/rkTrKCVFztXzbOzp4/t+PUNezpQ
	 zRdUYjcnfWf7E96D+xYzLhAvzMbeMzJ5/liRMwACzW8Q95vIpU9hx3FwuwcRavuiY2TGp
	 oaDkzy/dnEhKZ9bAy1mVGWKXCdMYAi3qaUOgTYQqVQsjSKzslvn+YecKXF6HRdvELlGWM
	 QkqLoXwk/V4xKg/9dmKmkAIvOSZe2aAe/2u9OEdBkPjnUUyXgjd8dPjcnRUpjZe0f5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DrlQYRb4;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C5F606AA4B
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 10:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98C5F606AA4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DrlQYRb4
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b5973a4b4cso2116653a12.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 02:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794305678; x=1794910478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9WFltYRvNkpM0HMxRLJxGiCTEiP83WtKPHu+oXy3KTg=;
        b=DrlQYRb4d+FJBQLFk4gip1vdMb9pZcbFm0QRoW/O9nsnnIGk5B/dcI7komCKzkv/uM
         Uz0TTkL3EB0XOLA2v0TTxwYvqDOvah1wiwbB4uUsiRRXfj1OcdvtnHWnMQS6yfKTNN5Y
         2S+sbZpFj/oUd6OIfB1K+t4luOgmpm8MRta8dNUBz+XdEb16ui6jztHrAySR2QYDDBtW
         UcH7ksMk3kyTCuhLg24n4RSbgP43bR1MD63YWBBHbNHKba+s6Adtgd3r0iiTavTYgvkx
         vCBmyxhjfzRfUpjuhY0K7x1CK/3uUIf/0FzbTbFW5bHu/k5G1xko0Cr6O3LrrObY61iA
         y+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794305678; x=1794910478;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9WFltYRvNkpM0HMxRLJxGiCTEiP83WtKPHu+oXy3KTg=;
        b=j73/Zm0L1nZsdNqoN/unasWvpkdY37WtnuP+gbtcdMEd85yGFthz/HSmoqUSRIOIx6
         5pTwTPhX8x+Z97GNJgwddD2ygoOyaIiebiemJcfyHtfPclOue3YYZODX0xt6aqD463KV
         k3ITjSSsxykaUOUiYXC12oMRgc50oxFv6Wibi1TKeejwUK8eCvwDObYFe3aYKiWXm2Yt
         rNVDgi4L2w1PbOFZi6SYrg4/fiQZLsvETkZPmag17Cs012qoW1uaGlAV+qbdpDDusION
         KBHoq6LVntdjYLxh7EeSl1PgM4/4BbzBK4DdKr93qXC+CAQMvWasdH+usf99mL03+v72
         fMkw==
X-Forwarded-Encrypted: i=1; AL+hErEfj+zbESl4IyGniGpPp8r5ChzQDFcSrZENfeiJLRATLTFrYdQRgS01apIq2xVE4E9jOiJGEdJ7RkjGrGhI8Pk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HL+4kqiGsOcwN0SPyAwV9QfodLBTHQoERYha00GVGQbsSgGDv
	3ieGHGKfdRO5yRdBlE3S+MYfJt7whO28ObD09z0mdvP9xverIEULpbv/
X-Gm-Gg: AYBFou0AeHHpsXP1BUs1laoHa8ttAet1ZEJcbLfK6X4YwW+SDGlsDbqEFCpP9Zl4JYm
	e7/VpaIkMLeLsduWcGQMK4/v12knGDKmUzI3RkKrCQE8W7Kd75dXN4JIO7VtNF544bz9843LJX0
	O/FnPzTSRQ1KuxFt8nWV6JEweCOsQnrWSmgGbNhjfG1GQJhVGnZKidDpXDJpzqtmE3xxIP1nF9b
	n1Ykvhb8+hh7hZmTO5mJoGFZ4JAQEHnmns98NJB/+TXcjyms11OjrWkWrv2PCkiAD2DRkjNr3FM
	VbLi/BybW0n8R8Iskz5NjSPyx2LlVWPeuLKTuGj81aYmXFvcRVfJNN9qxByHAqnIgFnLyewJgP0
	LZjzZ+ybCpFxPWn97XfwgCzjOzSpq+6xrqjZfbtBNTrp/MvOrz2UIvqAnU4GDhp64SsV/3eFIet
	dCoWvHWy2sQr9Hm5HNg2AeoEocsGyTGQJEeGujXHnLRAyNq8ZFixArdGikK/vEI/m1g8tUYonX0
	wdz/0RgFeVWqgHtJ/1ptP9gINDcrocE9k+DhVW11eor9UWOYgIqjxrqifOAIS0/HruqUD87b0XH
	gRnBiNBDTlgcbIPplOli/w9kz3E1w40Ost7uP02GeIXtRw5xAXgt1UIINEWHC+uhKqz/CjmkcFp
	zteOiwtOXoGGw
X-Received: by 2002:a17:907:944d:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c504963ce05mr189793966b.44.1794305677695;
        Tue, 10 Nov 2026 02:14:37 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a593eacsm90433466b.36.2026.11.10.02.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:14:36 -0800 (PST)
Date: Tue, 10 Nov 2026 11:14:35 +0100
From: Amir Goldstein <amir73il@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org,
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
Message-ID: <avLui6Mpf8GbKbtc@amir-ThinkPad-T480>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
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
Content-Disposition: inline
In-Reply-To: <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>

On Tue, Nov 10, 2026 at 10:14:54AM +0100, Christian Brauner wrote:
> The fuse server can register any regular file as a backing file. procfs
> and binfmt_misc files are already refused by the stacking depth check as
> both set s_stack_depth to FILESYSTEM_MAX_STACK_DEPTH. sysfs and the
> other pseudo filesystems aren't. Reads and writes of the fuse file would
> then be done on the pseudo file with the fuse server's credentials.
> Refuse files on pseudo filesystems just like loop does.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  fs/fuse/backing.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index 8c21a8a74efb..4e4fb810ddaa 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -147,6 +147,9 @@ static int fuse_backing_open_file(struct fuse_conn *fc, struct fuse_backing *fb,
>  		if (inode->i_sb->s_stack_depth >= fc->max_stack_depth)
>  			return -ELOOP;
>  
> +		if (file_is_pseudo(file))
> +			return -EINVAL;
> +
>  		fb->type = FUSE_BACKING_PATH;
>  		fb->path = file->f_path;
>  		path_get(&fb->path);
> 
> -- 
> 2.53.0
> 

Reviewed-by: Amir Goldstein <amir73il@gmail.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686762;
	b=TZ7/QKIuXBuDDBKHWBsRBkHJJ0X0KCDPsFJpY92LSmG3rq4HvZ2HmbJmWIa2adpr5Q3V
	 Qdj8j/hFVWhLO+2tkcX85lu9K8O884Xkeip5kKCwiu+IZSczxy3fM2SW2d1BOAq7W60Wl
	 IlM84n5oiHBwpgofhsd1aLCWLucKw3wund8zbxvJuzyV9F9d2qOvdaHvD9z3AO6DCSaIp
	 SO7uYSJDKMBzPDEbAmqqWuMwvnlT3Y06schb6o/F61GRW+5IQBnw2wqxJhSFTMNuZfYTA
	 D8egGOs5lxhCNXAdanf0rL3UrOytHYtv2lF6QGZT4RmeadboVhAINb865M/43pytLBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
	b=WFEDF1MPcUHAoimlgL1HzlqTWuXgMQWrmaRXQAzbVlvMHrCskNxCyj7EPlmbqpOS/GH1
	 leV4R/ahrISKC+RoSp8NclJpQr+zL5hQ/ZVzbyHyPia4Tqp7pwpV9K7Fpva681VfcgLOA
	 n/3RQgAyYx2V9WtGPUPKLCtUOl+0UO/QgpXRkVL900s0eErNJVBjejMXTYxgYQhxsYLnr
	 aaeLId3rrHS3wzOLlzCrMbHNaTuaY1stJdQM4zAo1FOyHcdDZtNajfvS2Tr9ZYp2o48Va
	 wojgAzA8O3fbMEmEJ2bcG8Azxx2uCV4afupy16GCbS1mfzlRvec4yZOdgeGInaDed1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=WyNKKpAN;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FD860A380B
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 20:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1FD860A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=WyNKKpAN
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b37951a397so307914a91.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 12:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686761; x=1795291561; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
        b=WyNKKpANsG5sdrHWGAt+Y38DvSIGt+WnCUyNYCZoBM4YbSq3wCVAHI95jQ8BFTGgLn
         +vM7af/q0i5zrzjZXXnriwzXN4L/RbeBg/iztvO0eyeIXYNiQp/OYlS5LD9yZqr2gKgm
         1I+5A88e/cV4J0nLZfgp0f7sQwj9jY0Q4quBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686761; x=1795291561;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
        b=ipBF3R2B1qdN0D2BtkVSrgt4Gdd/aTWtDBqIklNC1V5us/kFVl9+DLbzeBhO3rpJ0P
         eCtypirqxBStDoyyssgL71sEMXb2/WFj0ECrmJqnVAM5JrLTLMoCIVTLmIGLW8mF07V4
         6dpGXSGR8XeY6zehpSCx35ozraO8fMHNQ551nCfhElQTRbV/yOBZTbLJZEFs0fMiHOr9
         I4LTXbjoEtInKXgLjB1/fqbIGzco2EKl2v+z90x5XIsr8JjdalFfhdYtVc7hpnduig5d
         0RkEbsUN2UlgJ3xW4Iv/5sBvXvlToh7ZmABB5HYsZeJrhqjQ548FiUXTn3HqVrBxp8WU
         2LZw==
X-Forwarded-Encrypted: i=1; AL+hErGsbqp3grcGRDLw17jLEIVh5jMMEUgKGGSl1J8t8eHH9LEcvsqDNaBEIhppGtYp4TZ84T51pMsdHalX9S13A4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wZa0chmB+4M59fgMx9LY/LFlwX62v3f42SRk3nylPJBtPuXic
	Q+Sh1J89x3UR4eO62FZE+mfCoQJUQAOC1pTf+vuAYfRVZApI2nOLYcf3M+5PG9BQgaY=
X-Gm-Gg: AYBFou1hSB/OAL1HND2SFHAGzggKCXmkjDYQeQ50t38w6Z0pbs8VX0MfpEjEYZnKveq
	G9a+p4dCeH+K5MdXkz0Zlqvg34hJ/khGrYL0armojbfElfXYeyPSLTZKbaVLPiozsZI177fnHr4
	vqQzenvSscu9YKSKwx2Nz/4XSglAvXeCgbnvAv4GhYp0xJ41i1c88MZQMzfmjMA+44+uWLkTdrE
	O2PR7YKIpaFbn9LWyiFfyzV0jgQiG7eXiRjBucBHn5sm7V6YuQjV3qRuIbwrDN7+spwaB7vi+SZ
	OCnJFoGDibrcKfRre4leq8vTzeihG2WfWNdqeHsaPsK20K05N4/+YUPYAunfszFsZ5aPnxdTOpj
	BJJ3BKaty5YpIjMUWTt8Uui4dsv3LDlb/N3PCv+esECIVhafmdBl+ksOM4OinZ1f94e/MubAPKg
	i+pSxkq/yWUHehHqZRmvyJWr9yrweEQuy4tZf6QeJrVI7VL4EIiZwDdLbX4JBIcrBDFdIvs0Wv5
	G8+i27k5o2pqbtbixTvuY8U1g6bhZZiilz7LUD8XwULmeX5FQDE1lTcfPFJkOyToSuAY2XXc1Z3
	KkvIOZBSE4kzNBd85PJ612zaRsQ5YtG0NFSdKryNOuuzOfPZgvNi5pO616ffYG+kx1ZUm67aUlZ
	iXcpX2Xi26ca4K9KWRzDzhk11oUbJoB0xVkIVESWzNDp3vtFGzUXDb+TOICkyRqtX7n6UWNht5E
	0GMQUNu2k9XFcSK0+tQJxvEbF+hiIxuVQ6W2UYLwBsiAeyZJKMO2Joboax
X-Received: by 2002:a17:90b:2584:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3b1b0ba61famr5629200a91.33.1794686761104;
        Sat, 14 Nov 2026 12:06:01 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm5258887a91.0.2026.11.14.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:06:00 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:57 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
In-Reply-To: <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
	<20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Christian Brauner writes:
>+	/* Look through stacking filesystems at the inode with the data. */
>+	if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEUDO)
>+		return -EINVAL;

This looks good in general, but what the bots said about O_PATH files
here is real. With FMODE_PATH this is reached for a file that was never
opened, so on overlayfs nothing has been through ovl_open() to look up
the lowerdata of a metacopy file yet. ovl_d_real() then does the lookup
itself, and when that fails it hits the WARN(1) at its end and returns
the overlayfs dentry, so the check passes as well.

Only fuse passes FMODE_PATH, so it takes CAP_SYS_ADMIN to get there, but
it's easy to trigger with that. From a quick test with a metacopy file
whose redirect into a data-only layer points at nothing, registering an
O_PATH fd of it with FUSE_DEV_IOC_BACKING_OPEN gives

     ovl_d_real(/f, 0): real dentry not found
     WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210
     [...]
      file_check_backing+0x308/0x5e0
      fuse_backing_new+0x219/0x4a0
      fuse_backing_open+0xe8/0x390
      fuse_dev_ioctl+0x53a/0x7d0

and the ioctl still succeeds. A normal open of that file fails with
ENOENT, so nothing could have used it as a backing file anyway, but with
panic_on_warn this is now a panic.

Maybe ovl_d_real() should just stop warning when the lookup fails, now
that it has a caller that isn't trace_uprobe? The check would still pass
for an O_PATH file whose lowerdata couldn't be looked up at that point,
though.

Thanks!

Chris

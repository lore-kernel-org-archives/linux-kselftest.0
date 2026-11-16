Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830458;
	b=R54EIo/Jjz7Tkcapgfg8XbOaQMetHHkGlEbavKxmd3hSPiRT5mo78Srzc7kUKAyHApVC
	 NjcvHmyy9mib5sgqBrdwnWZ6N8GbCVbJD/r0B6vunuwNIi5LfL6AejY7glWy+nlife5DN
	 /OdKJxsqR0G80evP6llurJUSbW0y+r8WBvef1sLuUFwWwm2gvIoIpU5H+bgC8A4z4JsyD
	 /BjjtmTI1AKnn0wIHGTO/q9GopE2Y3L+x/iAK71C9TFEbMhg02ZDcdE0AGLVEi3ZuUBVW
	 KfviMOxjo77xl+m+FRk1Q24ZMV9qN+xYzFTTVSWMxJga+AFlwGDNHEUjH8QZHcdw2Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830458;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
	b=e1EOvXq+HjU9eFkVcX6xOU98EXmtjS1QZuNkasC2kQlGkPoCPH/FHTEePvXSvN1cfm6b
	 ikL7iYKnaCPF1hvNfp2Kyhz6J2VahHnfDLGDcC7WVA5GWbKAmph0B7NjWWQ5kJzx2t81z
	 QGNqHCv1B8F8s6RTRmF5dVnuAfs/JAZ+xciiaxUBj/KOYmcDAdIUwRCFW8hofUxdx51oe
	 XJ/jnfSE7IvmpwOqqW84NaiEhZtkw5+wEy67tluvJSjoe3Oax0RNkzMbI2Ky4ap8bWP8Y
	 ZcvX7DXGTVxZr4r4mdYIPKR+pNJTXZAZfCTyFgGRTI/ZfTgp6FCqwbw8wvvixzTcxVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HPhDK7mh;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D4C606A33D
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D4C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HPhDK7mh
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0461e040so2973444f8f.0
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 04:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794830456; x=1795435256; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
        b=HPhDK7mhvKoexu3wV/J5cAKBVCjdxnE0WqiM219E8yH7eWl2bpFOUxbsfidw15OaBQ
         3v/oOiLCUqOJKC7nE/sfeHMGODuUIsJx0HNirhnEfTrkTSlF6mxsAka4bN3HHTEKuz8X
         I7ILCePljUvo3TBsSDLONNTI31MYsfntJafmj4EM/wfNH8zBljPNWXbjdXsxXgFWpxK7
         QBsjZgUghWzTrvW3gB62VO1cEaBa05GYc2ZRtlRGIidAi9COFMIabjVojBmfGFLgZQra
         H+ROglAj/Ny78kycfy7M7MzfDC6v9ICyF5eD9XUlfn5SvIi4OODpHA/Ny8dfvpbuHFYW
         7n/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830456; x=1795435256;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLAz6sn1EqmF7aJ7KDEBtraVgj4ybxLcfJJY1MY6K34=;
        b=dfQSw1P6dBaaNUdTuzzRkrk8mlsjgtj7Be+qKwzuVHPgKWr9WFIXBz5X9Gr2z86y4t
         62u4Hj3V30CZLUMVHzQrkxM8LoA8U7s2Q0S4UJwwbxnUIFewGpGwPqV0y4Q+cB8mmozv
         aRbaSNBYk5YxJEBwjEAh8ixnzeEaekidU8adsaV9l5MNxzyxnxjUYp8toOqwXeqfDAJ4
         39gNLX1lubGHz9DraqPJ+qYGfUj17DQ9rHkOs8F6ty4DNrqwR84lqVvyE41wmLrRPbpB
         EbVW2SBrSJxnW3L2f1KlX3o7wCldD0VR/9EWeoakSaWrEOsjLMCEmErGnz6JXwu2qrwj
         Qocw==
X-Forwarded-Encrypted: i=1; AL+hErFs/MQgoz9MrpRYv+FFJc5gQtQhdorquVnmeFoxBdiurHM8svvryq/e68h57tYrwHZpWCigyyptpKNTGauIyLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VTycrrXMDV+3VVgHjaOtwZFB7Qd54phF1Ddv5H5kFYyop0Zfi
	Ze6LiRKiWvcI/jvvNmLaA8zGLKZout6fxfP01RGcfjAhOl2W7HK8c2H4OiNNXGaxXuc2XoEa2kf
	krp7Aj+ypD1J8rh+a2g==
X-Received: from wrso13.prod.google.com ([2002:a5d:474d:0:b0:493:3d97:6e88])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e007:0:20b0:48e:3697:708d with SMTP id ffacd0b85a97d-49c70ed8e41mr16698595f8f.12.1794830455230;
 Mon, 16 Nov 2026 04:00:55 -0800 (PST)
Date: Mon, 16 Nov 2026 12:00:53 +0000
In-Reply-To: <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-12-8cbbea1cf34f@kernel.org>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116120053.371591-1-aliceryhl@google.com>
Subject: Re: [PATCH RFC v3 12/44] rust_binderfs: use fc_init_pseudo()
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2026 at 12:04:45PM +0100, Christian Brauner wrote:
> Initialize binderfs as a pseudo filesystem instead of raising SB_I_NOEXEC
> by hand. This adds SB_I_PSEUDO. binderfs_fill_super() keeps clearing
> SB_I_NODEV for the binder device nodes.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

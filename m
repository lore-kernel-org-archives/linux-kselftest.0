Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323278;
	b=kUwXuzqJ4DPBOLumJzW0V8iFjccLCkMbYjXCERx4MkrFZUZEeWx6jU4nmIojT0+VvpFd
	 keX9sy80OVfm+5qxeFrEQ7B6SWrsIHUZYIzDjjxt2nQQnEOlzGZiO0nCIy8nbV+ksEq6C
	 IV1pvv5ZFBUQNC2yO6eXNeijqfk3qg8NTJAIrsAMBI6osX/OVJ+NF7JuDEX5Bv+SRnx30
	 q+dHynIk/51pbIgWgN2lDsxOq6UumocQ1MYm63qpKuzFKYqUxJ7+SARuXxbLsCQi56vwh
	 7AhMSwsN9aXpyuvg+T0TlqUbhjCvz4RjtOjVhdgqGzIOk46KIsoCLrMYPHsY2YVWU9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JtM9UtzYhAWCxTCfoBKbcmHIR3U4Wq7tzdw7gboBY64=;
	b=xE1ALORIXg0U3xJ23TeLyex0sHKziH2hnJYreBMITvN1yfZrUOd50v+wHUAbnN+NBCad
	 qtPo7RMoUGEehsVtI5xNSO5LNN5pHq8FwOcxkbkZdzK+lAIyjeSBE421z5y0uZFDe1qC5
	 phe1h8p8IKIUxPhG8gr5xDb42pNF0gYC236ehBfhrO053ob/BSf4qXN9JHc3KXf2fezel
	 /wLkz6rVkAxgVwplt7fa0KJpt6lWdOVucdpXcmt0g0LQIOkiVDCncNLi4MWtRGynbOd61
	 rHWTPYVT0SKO0FMukrNeuHzq+wQ15FQhflKbHfVMMoY7AxSY/c9v94N8na+JdZtM2yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHozpx7Z;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2092060A2620
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 15:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2092060A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LHozpx7Z
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso12775865ad.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 07:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323277; x=1794928077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JtM9UtzYhAWCxTCfoBKbcmHIR3U4Wq7tzdw7gboBY64=;
        b=LHozpx7ZkQyIUBsAkv4C311vzxfheFN2pzrL9Y/FTHkEXQzaVUkMAz9U9wFUejAOr8
         YATASi40x9WcOvyF4dkS6SJQ2bBJHO0yE68WsOT8oewufPXMhMYT6O7d4/5H33a+EMHR
         jjCu1KqktdAA/9c8ZIpbjFjA/3BLyNbgEZc3fS3F9+PTZ5y3jCgkJQ9rhGft5ONP+cJO
         aTEF5vn9sQP8UWqDXO8UszNcV0yZFTKvtrsUk25y1Sz/3h5njQt9uj1PBQLO+FuWPgpB
         LsGoLTWDE/iFYFuKD+GJLya2PXFipxPXM8zYDthkWkjgd0549O004Xgoom3qc/ylK84T
         vykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323277; x=1794928077;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JtM9UtzYhAWCxTCfoBKbcmHIR3U4Wq7tzdw7gboBY64=;
        b=HHGV6y9ueet4n2HbWc5oQmhx+2ZbxpKVivk7ALzv3iXqqeT0RCVOH8+plae9LYzJaE
         p/QxgP+Vz7+HpXgdkJu2zpexUWhhAQg99zfSCykUmvp035wag2NCLe1Texf/ARF6AXOG
         s7xYhkGWfTU2hLu4Dx2wI3L2ixeUdxUiG17qRf3gTsbZmSS8nTnNiI7kCTPY3cHvIrNy
         yEUXZvUqhIzswaJLNc5vz/sPrtSP0J1GNutJcaMAMnwN5H9Ib1X4gPvknYlNeTCe/kLv
         GJkVvkyc+QCxrgFZfYwgRFjDLFVfUie5SRvlFVUOK5GuBMTpcEDYemAuhC9ttkovv1uu
         c3lA==
X-Forwarded-Encrypted: i=1; AL+hErEIP2TW66g3iVW+XLFU2mltmTuZ61p4XbVItWSf6+JPStEVJajV9oUi9+tfbBY80BtayGIA+E3NFBF/SWBLxzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T+Z9PjQLrk3cWw7z/OQghX4yyQCJZMPgg/loQx48aZVtReX3G
	TjjAi4PacH6Z0UwkDtWKjpiv/asxSp+dKhxkvQ3oPqU/mfStYB7AewQU
X-Gm-Gg: AYBFou2cDZ8+aHKG1CC4dOL0T/BYuKkAAS604spDDWrfPU3L0Ank7TUnn7NWbzNomRu
	H6qUIRJDCuLiOgm3L5F4xLaCe9KSjulnwLO46U295Jw0LmBt7ySwIVCQ5klBSLMH+IuUMZHHa1T
	Hq1F+M1FjyOeU6oj8eKJPh+ql2lfPU4iPPAfUYUV53U2VRbQtLNFPMkrBSB5xtHzkrzBuhP7DY8
	3NoC1/rQpKgVfUL6MGVzS4QYSLh2ChumZOwFyaGqxolxQzqTCgtKiWsDVLD3TjXzIF57uIgyE/j
	mwBrNseRFdtXAKxLOHxv2sUxzpx3ANLK0FmwZqxlU5LTQPQOJjWb/jvU4UNLd68+Jr44pTQTxmm
	psM6WKPAqxX+TtaTtuYBQrfg0dlvSXsmtf4ROFEQ/ls37TWopcKtovp6+nmt9BEYrGfO5M89tLt
	1SAzh0JTy1yC4Yz+h2MvYpp+T8UaJoEpgD3Ev7toN79s9o2BCfmdbe7g8A48vLk9G/GxoG49Y/n
	3V7oK8vqWv4OtiQ+/LKHn+kEA6g2/m6bi9QaZzB6OmhVyywNfTFGCR82+5FQQhFB2vMj7jJ1lG0
	fxPbd9SWlGT3BNjwThQ+mcsgV8d4ezfTjgNnlEI/Egw+u4P0daiMEsc9VtakOUfVAoP6HLazgR/
	gyNMFoxklZhE=
X-Received: by 2002:a17:902:d481:b0:2ed:1ef3:9ec with SMTP id d9443c01a7336-2edb9172a2dmr26826345ad.14.1794323276968;
        Tue, 10 Nov 2026 07:07:56 -0800 (PST)
Received: from [192.168.2.6] ([27.75.101.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d78dbcsm10397575ad.27.2026.11.10.07.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 07:07:56 -0800 (PST)
Message-ID: <71f76e5e-ce24-4a71-863a-169ad262c510@gmail.com>
Date: Tue, 10 Nov 2026 22:07:46 +0700
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
Subject: Re: [PATCH RFC 36/41] nvmet: refuse files on pseudo filesystems as
 namespace backing files
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-36-4c998976c6c7@kernel.org>
Content-Language: en-US
From: Bui Nguyen Nhu Quynh <kaylovefoss@gmail.com>
In-Reply-To: <20261110-work-loop-pseudo-v1-36-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/2026 4:14 PM, Christian Brauner wrote:
> The file backend takes any path that isn't a block device. With
> buffered_io=1 that includes files on procfs or sysfs which then get read
> and written by a kernel worker on behalf of the host. Refuse files on
> pseudo filesystems just like loop does.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  drivers/nvme/target/io-cmd-file.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io-cmd-file.c
> index dfa8aa46188c..71c69bac5394 100644
> --- a/drivers/nvme/target/io-cmd-file.c
> +++ b/drivers/nvme/target/io-cmd-file.c
> @@ -52,6 +52,11 @@ int nvmet_file_ns_enable(struct nvmet_ns *ns)
>  		goto err;
>  	}
>  
> +	if (file_is_pseudo(ns->file)) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
>  	nvmet_file_ns_revalidate(ns);
>  
>  	/*
> 

I noticed patch 41/41 doesn't include a test for nvmet. Would it make
sense to add one with buffered_io=1? The test would need a pseudo file
that can be opened with O_RDWR and supports both read_iter and
write_iter. Otherwise, it could pass without ever reaching the new
file_is_pseudo() check.

Thanks.

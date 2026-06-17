Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98003389E13
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781684561; cv=pass; b=fjwHAqyrYOOQHjvpuSlzD/T/SST7XnoP+KbQRG/4GITMXyQAoCg9xpb8zk46H7BiFXlFaDxOZHZKlbF+48NMGCxmpneP4Qykfrc75fKij9z/ryd9SwtckNB8aLc3pBOu93zthzbZ77AAjNos9HU4OLUpKtnNh51h45DFNh6W15U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781684561; c=relaxed/simple;
	bh=xvOTAcL/OEi1dP4MlZ52ki7wL7tL1sQQL7OUhgqBmNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsHY4fqZZd1AaDpJ6b12TdMsd7hS5jInPV4UbKbBaYlKIeAh+pGdVDZzPtrWngHlZ3czRsQqk21pE9e6iPcAwvSNEFBflIbfUMS+g8xawbJwIyAiwU25myfOTSoV84JhlqUNGyA7p/5xfIKk3OSJ7nacUiU4gRuTilFRuRrOgAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=rMi0iNIN; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="rMi0iNIN"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51764768c36so75959871cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 01:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781684556; cv=none;
        d=google.com; s=arc-20240605;
        b=Ikdn4ZGYP9PiG5++9pzHbCzGPFR1SAApGI08ad6iWsfiBbsKNR0Tv2m746YSqwtdSg
         dAJ85c/Yytoqc+o109mdeHBmTysbpmhWwUTr05yUoE4lhQfVVyrH1qqlOCh2e1OK7DoF
         1oyyBO0J/ytBS2Q99Lbi09G8Xw0ZWw0pd6Xx+E+A7MmXn13+5T+/NFu0cjul/+oQ7HIj
         nJ50aWOzJ/dIIEZxczZQvJv/UCOK1guM9F09OfEtTMRfJSjTVuJPGCdTEjVFKDuuwJzC
         ywPfohn+SNUQ+HiJZ068S0PGH82+2j40LqILDW3rHs6FW+jWtmq44s6+Ay/tqfkyrFqo
         84AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BU5fXnVq2Oqd0AAAN7spvlRTj86TwPYYP6Lo343Jbco=;
        fh=i1uAfrbR7vVM74hXR3GZxYoD9WE/FHoQPyLF2U8UlXc=;
        b=aU+wWOyypWDtIXsn1AIwa3inubYAOWl/nPCNXkCKZPXQL/9b0RdPLHpVslt9RLLA7a
         l+qm63kvKEgv7+H6AcOnO024hNSueQLvSiS5WJt3661IJQO+p4ecIHYOJD5rYi4NVYuf
         w3xkNmISaxzPFsCpZjWqD03cqqsDXrU+W/32EKtIagQp40OzSqRMc8V/gaZUsk49GMUv
         TRd4eCqPpJWwnx6VB8pcU4RtzK55VcTe+ul8UAHiLwk8e7J38fTS8pJXJNp9d3A0mZDX
         WgQikR3Uwx8E+7Vcq+CZNoyKUmYxiuOXoVgnvwaDG++SoxdVKJc0wGRQVT/B1zuwGHKm
         /4UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781684556; x=1782289356; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BU5fXnVq2Oqd0AAAN7spvlRTj86TwPYYP6Lo343Jbco=;
        b=rMi0iNINHVIIU04xYxHAox8+KXWg3Km2fZo8UC0ogLSyCYukBp48Y2LATQmEzeKIZ3
         sOokLNQNeqIhVniNeFcxvWMePu7oQKia5baTHQFYKvoJEU7Ctxt3I7Kto5pqxNRT5bPU
         07LzofAiUvuU4B+PFpuYAOSrFfE219M22LYGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684556; x=1782289356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BU5fXnVq2Oqd0AAAN7spvlRTj86TwPYYP6Lo343Jbco=;
        b=pWuv8O0iGzOp2Ava2kL6MCtwXVIZI6eRTWpshZoY0bv7Y3GTMIfLzA6/KrMV23Cg0a
         TiYvDfvloJEUvjG9F79zL0SgLxpw9CskXZ2Z/rIdrhWW+Swq73S0tC9Y2NbCPKbD4i4F
         bIb1ov/cOVqDVIuJsHyDQHXJ58G5fzk+a7TsWycd2yYIZ3wltIb+hFLDkydLggrijiS5
         lxFZP0yT6odm0bPT+Jv8w3YMofUNkfBNqiOyqYABumuPt/PMhEwN36DL7ojXyv97HfZ0
         tixJhGHzyq1Pg06EZrSj3UXBf36dZCqYQ9Ox2yW+7JMdEtvtLqsCHBcmWR/KHoa+6cks
         jqYg==
X-Forwarded-Encrypted: i=1; AFNElJ/Ttipf+s6ApKjx5r5uZdf/X88gL7mIkay+1S39H4j3Hi/ja3iNIL4K6yN8A9st8TAzC8rD/i19VLQeaBFwBXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH4P6HI13xeF50PRGjCNIp6rTsVPlgnmtCUO6RW1piq1Ae6t2p
	yffsPEDFfPYTrg0dQNv0FsMszS2dwPZC+u+9ml3PU9vXOMNLTbYyJjupyEiKgnjgE4d45HJ3zML
	A4L/VlkAwdeAZCd66sblz4d4n1aISW2yiWzXne6Nkbg==
X-Gm-Gg: Acq92OHI+MPTxoyqAvfYCHr4uuTJNFiz7mtOtYVuc149lwW0bRI19uFWRX0tbJC2e3J
	4WQvzxiOBM48t32YYJMTC64bMmX0UwHtSlU+w+Au1L9L56Pxyw5yf5bmwR6WU3QpAxRZpnOWZvk
	V9y22YnTM7BhFdCiZnDn6FSp1jmJgznzVmSUAg5sXIlJu/70A4+TpkAFN5fi8dRuNuGO3Oho0dG
	zxGwe4rKyDhE9/gmYvpec/b15SHnrrbomscjRCVlrClo7aZYjVMf51KdpUwbsk29ZuAFyG7Y5vD
	rCQ4YY2BfgBQ0cFC+CIavvYFV4M=
X-Received: by 2002:a05:622a:5516:b0:517:97f9:78f5 with SMTP id
 d75a77b69052e-519a8c6606emr50572071cf.10.1781684556219; Wed, 17 Jun 2026
 01:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616151909.916667-1-jamz@amazon.com> <20260616151909.916667-2-jamz@amazon.com>
In-Reply-To: <20260616151909.916667-2-jamz@amazon.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 17 Jun 2026 10:22:24 +0200
X-Gm-Features: AVVi8CfLUvw9HEz1q1LlF1z_PcpL4rUpzyaGd12mSg8e3Xcq01aL572WH-arImg
Message-ID: <CAJfpeguaa4U6Tsxh5opeaLeYQQxP6MQsRMu_JATJwwgj=OBt3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] fuse: allow FUSE_SYNCFS for privileged userspace servers
To: Jimmy Zuber <jamz@amazon.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jun 2026 at 17:20, Jimmy Zuber <jamz@amazon.com> wrote:

> +/*
> + * A server can stall syncfs()/sync(), so only honor FUSE_HAS_SYNCFS for
> + * mounts owned by the initial user namespace, i.e. set up with host
> + * privilege (like virtiofs and fuseblk).
> + */
> +static bool fuse_syncfs_enable(struct fuse_conn *fc, u64 flags)
> +{
> +       return (flags & FUSE_HAS_SYNCFS) && fc->user_ns == &init_user_ns;
> +}

Sounds really easy to trick: start the server in the initial user ns,
then clone the mounter with a new user/mount namespace.   The
init_user_ns test will pass happily, since the server is running in
the initial namespace.

Thanks,
Miklos

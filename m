Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D839339719
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 05:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786600674; cv=none; b=J8LNXitDBZcpipuG1RduabmfQyrUDX/E8bOfO3KaBtYV/71OrSIEzBsPdLMc1lLq5z+z/a1Kb10a8+FRfBsq8NyXYtpnUGz53f0+lkJxuH9wSC5I+U4cfwPpiQzUGLq9Mby/mU2e4pgRA5dX0pyK+sDIFzKO0xwNvgZRZIJd3mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786600674; c=relaxed/simple;
	bh=Mrl9k2OYxCttpt0oaJBvFcDv/awuA7xGxUf0yffgjFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buYaKiXLkPHchyITkPIus2qcirlFEfVlZjHsF7epb+xNvMh+LA+YsAJrW/U7B1eyk4wtbEqvAUQ90qlQoFo6XVrQX1YHUX6JiaKUvpXg3WBz9w2ip/fE6yw2MWDO0yHYkMAEGZN4ybfpIn+aHUNrAD/V4HqQJvyn2XPDm0VsSQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5r8olKb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5r8olKb"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so3035965e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 22:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786600671; x=1787205471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+7PeLXe+ue8rItbBi6+JlGfhsV/36WDiPAKPGI7m+do=;
        b=Y5r8olKbQA4KmcW9MwLfY1sP4HOfESCCn2SatRrFA1havzjn0jngfHP5fQr+C0cUyG
         fTw0KXazOJ/aIWTvGZrcSno+nEZYHc6nPo1dPcOgL9YSixO6mslcCv0kUUkP+0l5o8CP
         ZXzKp1GQ9ztiLIIAl1MNiLrcukdAk6UsKM6ziWifIzBFTPYnbUdxfzMYowI6cXBbOgDq
         3hMccu51xyUq6krsQ1N1jxgU/eGuNjm7yai5L9fy2tdTvgdlex6VAQ3rz2trW7TZmYCA
         r8NEtB3BBC0y1MW3r2OSGnroBwfSCih2ThnoroyJ2prTNj8hiVMI0sifs/YiREQ/8NEG
         Eu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786600671; x=1787205471;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+7PeLXe+ue8rItbBi6+JlGfhsV/36WDiPAKPGI7m+do=;
        b=Nl0noE0cYORB04LjtfZD3vuBhggBg9OABv3R4RDmmsQK5bnXJ6PY4b/NA04w+te+5J
         +zBHhZarNA9mv8u0Gc3mFqTnER2pWfMlmB9U5Xc1zHf5sOpOvfwew34HQ+7GAXNBkrOB
         LP7TBn0kU+WANRAAEOXhCeqcRLu79nkjFHH4Fd+MxsP5CnLrRIcqnv3a4LroiQij/Oc5
         yzCXY3xSDibAyrGXiwDpRTxs2u4vMcledGf6iypMxq34gZWotNe9srA4uLzO486mX9op
         BdiAviMPcg+UNdHpuxfk1wogQsPUr1wyadXrw47P1zYxF8j6+kEn6vMBbxjS6+Jn1821
         npAA==
X-Forwarded-Encrypted: i=1; AHgh+Rp614WukSa35uvTxOX+oZut4sPyynMBfSbxLEtJv70WBG/QDfdt7N7ec2TppXzlzCSThs2S4KPR9/CGQOCv0LE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr4yiJ67fmNjSx/AqPUyfZtPU1vkbIuo9mBSSt1tKE5u3/KP5F
	WimXCmQA9Z0ShJu4bkDrUO9huUAoDRJR8anIq4YxVRmfNfDr+n0LnINZ
X-Gm-Gg: AR+sD106MDJ8UyPRXi8av2fnNRK5KfYNY1C36VG0uAu2/7cgrIRLcrBzHuq1uKVZBZr
	Js1qEJipfX21D2Sn1GX2PD/Sr3MU6CPw61aM2J10AVCieN6Rtpy3xiOvDi22HKHl73upsOAgYSs
	dWrG3oLtZuT29DeuNIkiaIGA7KqdRVrg94CadiJGsxyrxwFCACPluEXWseCD5swpeEKuQPSAMtV
	GLj2qf671bkNp9t0x/BuOQNDkgTpKAt7blemdts3A98FWnC9Xm3wWDe5O0fr8mpfvO9A6bySRij
	v7T/r4+vEsOk2DpNlAY5A2172Tuk4oon+mbfyuimSc35rK2ys9CL/ou4sGIJd6TYVGIyHT0BxFe
	4HolxXIJNKlK1UB8o7NPP9pxm6dnxKbbTzHUjCIhu9ODWmT/etTUE4mpgW9587uPwRyNG3SewGF
	8LsFh39arYfhPxgvILNZKdL7U+G5BRpxlTX7iWOjqH/I5ecAx6BeMeiT0d1goAkQ46q4KXbhZcT
	KHtaytdj8fTgoWpV1OZCGjNMu1IEcA6C3+lxEwWupAYGlfIkYvhL7IfhO+9kxpBJqo22zCC2DBi
	lExfL/aurfN6UOTC9xuj4S4QjZzYman6fNMz4Yaga+bbSAWFS64Cb68EGZHd7oMFshY=
X-Received: by 2002:a05:600c:190f:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-4998218e63dmr29591735e9.14.1786600670592;
        Wed, 12 Aug 2026 22:57:50 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-9c79-1f01-1565-573d-10dc-99f9.310.pool.telefonica.de. [2a02:3100:9c79:1f01:1565:573d:10dc:99f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4998216cf70sm28991305e9.12.2026.08.12.22.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:57:49 -0700 (PDT)
Date: Thu, 13 Aug 2026 07:57:48 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Eric Auger <eric.auger@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] KVM: arm64: vgic-v3: Roll back failed
 redistributor region setup
Message-ID: <an1cYl928Fue-z3s@gmail.com>
References: <cover.1786344511.git.kmehltretter@gmail.com>
 <4e00fc25aa61ec52e6ef033a53588ce3f5550982.1786344511.git.kmehltretter@gmail.com>
 <86tsp2139b.wl-maz@kernel.org>
 <anotFcOP0kcQJwrA@gmail.com>
 <86jypv1lxo.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86jypv1lxo.wl-maz@kernel.org>

On Wed, Aug 12, 2026 at 02:57:07PM +0100, Marc Zyngier wrote:
> On Mon, 10 Aug 2026 22:22:37 +0100,
> Karl Mehltretter <kmehltretter@gmail.com> wrote:
> > Is this closer to what you had in mind?
> 
> No. I want *all* RDs to be gone on failure, and the next successful
> registration to result in all possible RDs to be matched against a
> vcpu if there are enough of them. Effectively an atomic behaviour from
> the PoV of userspace.
> 
> See the patch below for what I came up with.
> 

Understood. I believe your sketch needs two small adjustments:

free_index must be incremented before kvm_io_bus_register_dev().
If registration fails, the current vCPU already has an RD assignment, but
there is otherwise no increment for the teardown path to undo.

The garbage collection in vgic_v3_free_redist_region() should remain.
VM teardown frees the regions before unregistering the RD iodevs, so
removing it would leave rdreg pointers referring to freed regions.

Does that look OK to you? If so, I could include both in v2.
I'll also split the selftest change and have it check only the
final state after the retry.

Thanks,
Karl

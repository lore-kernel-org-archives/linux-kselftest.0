Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342644;
	b=zl2rSCBiRUFXRLkPPldiLMsWA4Qwexf3dF7Jb4aG5AZeI2/15k0di7Br4BFSbxqeU5ZN
	 1vU1jfPI1HZEbSG5tijNEnZ0HpsTqrbav4BCgrBFa4OP25qLD++owutmASHyTWu7Ch+8N
	 o+jBp9kAedApAE3ui8ACukCVE4n9XNXr5Kb3uJ5R3NVJ8w24K4e3j4LIfNHyxsC/b+jxr
	 63wu3sxWNW/Fk1uN2TAnabFte19+yXGXKW14jzq5ye5Jm5zIi4tOg5MpfBuqpAZ/C+9o8
	 e/Td8rMrAW93UU3Ry6sK/1AsuPd3HLENEGWaQiYKh7V8T+UUvXt1lPJfpiajbW+Do7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=gjXaKiyZQPSwExAfhsrIhyKjre3uu8ziTpIkVVhFMVE=;
	b=VTD2NhcPPQ2HSlyahrWMfdjSj/ZAPgrBON7ge+H4sK2b0WQlQTZqWvjXdPHjigQgrphT
	 SlX11JhecT8DoiSCSC+vMFeHx+ATFROr7nNLe6HaMwlvjPmsXE9ZEne4AdWHq3IcDZGws
	 M6RdzKxQho2kjREHgGrVJ4dLdEOJjKuU0GDX1QnjiYBTtthTQpXbOh+FtZFFaPG6gDSII
	 pWOOEk5jiMIKyXS7EuwlHMcJI8dldl2Lx7lp1ZmGOujHaP9IKUusYMvSjUTMGM41gX7Xr
	 64L0FW4Dk7IKumDMOonl/bOzsC0cojsRMzaZrfr6IRPpjOaz3dH8d6rd6ZohnvbbkQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XnGLrhM9;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EAB606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 20:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49EAB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XnGLrhM9
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb45b4ed6bso2263562a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 12:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794342642; x=1794947442; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjXaKiyZQPSwExAfhsrIhyKjre3uu8ziTpIkVVhFMVE=;
        b=XnGLrhM9pDAgt2m1qDtK+9GDh/WOJikUa953pUSNK3mBUmTFvEOyyrgcDQ9ShgICdD
         QV8hvlVIUHgtzRXUvnCLJekubr+thbbb6hQty3mB+5RdoRAWAyLbUviTzlVGoVJUSnDQ
         e9yGlyGKLlM3sq9/s8FrhZtge5njBKh9hUiwGV+4C1JMOT8+SE2BrhdqfT1yG5b5kTD/
         arF0cTXNue89/rTdWdRHjcoEKdav9p9B7ko0Gy7DgTxbAxnVT+yA+NZTOSQtIUQUz7xa
         yZhdVd/VrErRyupOebn1bf14660C/3iHlWHT+qQJhJsYoImoAwdytOCC+IPi6laLvcl8
         Vn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342642; x=1794947442;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjXaKiyZQPSwExAfhsrIhyKjre3uu8ziTpIkVVhFMVE=;
        b=DpMkkJwjZp6moq63kZqD3F1YHODTH65WhJB/iwo3U4OyFB25l+6Vqc8gswe6FRONIx
         8hx/pJgZTvtCrEczzWLkuOx1LvcOtJDxNY3qxmWu0noopk3j/MVyjOMM04UisBtxR0G6
         Z+ezlhLBXzeOHxyj1fvS0llOQIRgK6+MkfVpzG2IvSxCKIlRAOKXamg1vj7VCThXV13X
         SnJNuM4GCUS8ICgWWsqJx5UpIGDUEZhL6FLYw15R5ZSTj20RE8FjFb04FWTtPmo9PU0a
         u5EgM+8pbElI2f7cW0TqISmCEmoaFx9VnxY0etGmFOruiUiX73eiE8YgDXgh6l3CA0Oh
         ZPkA==
X-Forwarded-Encrypted: i=1; AL+hErECgFZPMrWP1SI5c//teKDTFVIMAyDi4fVFRxJkT4qWDrR+K7/IyPbLElEtbFeYs7Fr8oBhqBWmv1R1ufV5tYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y0kHBePU551wST9SUOg/7aNujPounrRWuGoS3VX2qLHRwWQ8g
	Y0cYSHIU67CxqE6YXnxRrrn+ofbw0MLednUV+s5Z1capjrPo1Rj2JO3zqzah+ntluPRTfvRyaag
	JkRY8WA==
X-Received: from pjbsx15.prod.google.com ([2002:a17:90b:2ccf:b0:3b0:f7d8:3b91])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4e8e:b0:3ac:ffb8:183b
 with SMTP id 98e67ed59e1d1-3b182f3e1e0mr113027a91.51.1794342642319; Tue, 10
 Nov 2026 12:30:42 -0800 (PST)
Date: Tue, 10 Nov 2026 12:30:41 -0800
In-Reply-To: <20261109210833.1250548-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109210833.1250548-1-dmatlack@google.com>
Message-ID: <avN-8S4iZKD6xRMu@seanjc-mac.roam.internal>
Subject: Re: [PATCH v3 0/5] vfio: selftests: Automatically detect the IOMMU mode
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Alex Williamson <alex@shazbot.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 09, 2026, David Matlack wrote:
> This series makes the VFIO selftests library automatically detect which
> IOMMU mode to use, rather than hardcoding iommufd as the default, and
> makes tests skip, rather than fail, when the IOMMU mode they need is not
> available. This was suggested by Sean while reviewing the KVM selftest
> irq_test [1].

...

> David Matlack (5):
>   vfio: selftests: Automatically detect the IOMMU mode in iommu_init()
>   vfio: selftests: Skip tests when the IOMMU mode is not available
>   vfio: selftests: Print the IOMMU modes when a requested mode can't be
>     used
>   KVM: selftests: Use VFIO selftests library to pick IOMMU mode in
>     irq_test
>   KVM: selftests: List the IOMMU modes in irq_test's help output

Thanks much, looks awesome!

Acked-by: Sean Christopherson <seanjc@google.com>

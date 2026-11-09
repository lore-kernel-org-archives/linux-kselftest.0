Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794240043;
	b=sAidz+Cn53MA8Qc3s+3guKu7IxQiJTtY1nLIkchKyY3fSkRAbz0qnbdZ5CxnnEnKuWME
	 VZYb1yxwKr5HJr9wCQFe4omhP+POn9w41kD4heHClndnSFQLG+2qz64pYt2Zti6aOSV6m
	 nG5UAuUEJAjrfP8Ah47MxCm5zU669VRzNqlIr4GM3jS4BNb2xhLyEhzlRcwQwTcPLzzpH
	 o0Bs/QbsbAelKTMRtX5iRxh+9X2LyrbakzRZpI+fOhQN9tZAJGVPZSILAb7mwItyKGrJ+
	 y+jCWW64gjjyD5Fs3NuDhOR2sdtdxUOF/nufR+ijXrACPXEpF1Ule2zeM2ZlUiGYB7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1IVvR7owaTCfwRNK1gEl9dRHd5D6+SPRltJMKFkI3Z4=;
	b=LcWF1jOC5Xi3UlHykYTOUwAG+dPKwwtbykySMfbuOWuCHq64qWoDYp9BFTdf+LZUp5yy
	 sc2W5AUUbSXDiBdA8ncFwCkP9qsLoRZ0jLBVUo8a0lVF6mNdyh4Q68fU9CO5pjmTn5yPA
	 kjiUzqfxCcfNnfWxmg5IK84Ou+JELTQVMEJhdftir/hs40X2YjPMP5GDvYPaQSDyfMnFi
	 UTFTxp6XhDpOimoyXhRO5JfwsvZ+a1JzVsPBMq8wdPNf65LWQrnQnQyU8HKFAGt/QDPtM
	 LN8hMsvQd23pBn7DF/dO6ceouLhP2cgBBqdu/RfIGxKQ3aWB/IEFyOfa0mzEfYhRbBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eVKMSmAw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26286082BD5
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 16:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E26286082BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eVKMSmAw
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c1f548f87so14166796d6.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 08:00:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794240042; cv=none;
        d=google.com; s=arc-20260327;
        b=rzA5+AaTV29gPdobVUy4NXefLfQiIheUFR/gcePG5CChT+BRAyr7svLbIiB74WEoEJ
         eSJ2wCVmROTpieWMo/+kU8S88PxTOUkZbvJbDeC5VNAqdq8WQTLIZJ9oCKTNf9LmGgdE
         owOEktOwrCQs5l1hzEvcsPCBKM002YAbrtuMjiYArG9p6ZXfivhqCpOJnbX56L5yy7bW
         tYdWb8jbiZ4sld8tC3gAuFUoPizHl7W++hKDLikqANGugKDjuBxmk8iUpc6eY1jTwsOm
         SRqyFL5OYaIKTkIXbGrAod93zkL71LOgRK34TrJiQfY4HvgjbUa1V/JlaKFxRBqyqytW
         gh+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=1IVvR7owaTCfwRNK1gEl9dRHd5D6+SPRltJMKFkI3Z4=;
        fh=EdIP+vjHUpjBZ47w/QrtDXK03DNmTkw5XoyerVcke/w=;
        b=KI3b3c4Prd7JT3k75VQv2bOgWSjOQN+KaBE+Eq/ulJdLvzmqQlDMQXPoSTsiLXVgDN
         B0fkNow3LVNAyF8hm7koRsc0GjubM18f2JoMSYcZGqyUmobbUS/N3vRZCesX1HLM1jNv
         LLfKx2JNqMxiJAoSHWXmDYDaVSQgaGZnJEDFGMUtihOkyXoy19B4k9NDFb7ZtItDprf0
         qWkS+GbOOQtPGYyIHgoqBM7of/GUr/dWHanbtEwF1AAN3fnWAVnaajAKKjPeC8xskpjg
         ss5uBypx7jeD07d1URr6NGzSS7TBHtJZUppusxlVLaNWRSS2KlpiaqBEtvqjjw49jca0
         QqPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794240042; x=1794844842; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IVvR7owaTCfwRNK1gEl9dRHd5D6+SPRltJMKFkI3Z4=;
        b=eVKMSmAwRDJ5fSeCORPgxCIKcy35/jStL56anO2mdaDeqKQUdUUrs7cHpaWXPuZrEe
         WjOcE/rFJJZDNtW8F5K7QKryfLTX9qxoE6LEGRTnqqKJhwB3SztHb1R2eVMupG+FZOKD
         sHQhKEJTm4xF3gxKt0PCmeqvGwDrZSCcl83RNoSyuGQXOvtLSuWD+rtxn/xMmCiBh8wl
         jqmJmZEGQxYee6qcqdzBIofbPAvCVKcaAD7DLmvkc9zIGZ0ND7pzzZOWCx4LszFh1ntA
         yUlfb8w9bELqfWFcod9ve/nX20GnAdXBKewbx7uv+Qcr5Usw+tWjXtqTnTge+NHNW8Lw
         nBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240042; x=1794844842;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1IVvR7owaTCfwRNK1gEl9dRHd5D6+SPRltJMKFkI3Z4=;
        b=mXo/KgLDmQs8TOhC3pvnCBcFokpKrdqhqvoko+NfovD6HRimmeOXgFt6Xdp9vY9pYl
         G6HZ2x0zaIpcT20xaNaTNoF+O5TwnWPFdQIlMdoKBwkTx8yp6DYBWjKtmX8X91ueNTEq
         PKNYd5nRaKtiheR/Z26edseDr/lyTqtlWTROznVdUPOCyniWfQFQZMZVTQzW9YS1VD2E
         lfROAEZB4p2EtDf8iFXHFGdiuthU8K3UB0r4qWp6eU1lp6+jJRMz3brVD6g9z3MoWIo6
         noUgR63/fvC9WCw7PI0iJcmnpDAbOrtMeU9tZasukOKC9g4ErYsQzl3z2LElpD/XS6ye
         001Q==
X-Forwarded-Encrypted: i=1; AL+hErFMmDQLGpV7mVNevI0X5PkKSkvl62/L8vBqWzrt/OI/Axrdx/uPbzwxrR9CrCYUPHRyArrKYqqclXA52Yq/EDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9l0M4wpa7kD080tKujUNLn5nlQ389jc6LuR6gTQVwS4jO1+t99
	9kxpA4u9QhAxvIYDsEDaJRekHT7mdygNBRkvE6SxzbF3jdw++KJValMNgVKO9TqPDXbA6NFH1EN
	mhWrvy4PkXCDndLrbgr/5DEohsbFwUZQUZseCXIwL
X-Gm-Gg: AYBFou2UX9juttublH8NgzLz1AQ/ZJw9dppIpLgLVIloKTXeJ8B3JBpDp2Lmt9JOEe+
	hCb+JIqZHUjps/XA3MtV5SBnmRLl6vnXqM5HVD+gmH/Q69y9E2f2IGbXWhjKTp2a6HqQILbX3er
	k+jQpTFO0EbYAphjrcb4712ugV8cdrVL+jyiOAJOTHCfRtzTl+cjsd6t9ktGHmwvE3TeqHNI8pz
	njsW/NDM9i+7g1IwGqPugx1rtTsOBvBGr2Z/5cO+THafpeqUegMp4ZXAtZaB8UqGur8rtG7381G
	KZne45ZqMevm6/dv+UOK3PWpdO8gkFaGhnk98VNCt/tQiLG5dTJLnQ9w15RrWmIzWpgBPhk7DX1
	JaQKs0m+GgQQ8aDC2K+zlXJ6/5St9AqUUzTiNzW02J9vsdZdS88d0SRr5mMmqNo5SYw==
X-Received: by 2002:a05:6214:5402:b0:91e:ee31:55ba with SMTP id
 6a1803df08f44-91eef8c841emr97756d6.57.1794240035928; Mon, 09 Nov 2026
 08:00:35 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 08:00:34 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-2-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-2-2024e8fa517a@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 08:00:34 -0800
X-Gm-Features: AclHuK8G0EZDW3tY7sTDlhlnaXZOXK3ScUEr2v83dxDnmQ6yymeVPIAKQ5tIQLE
Message-ID: <CAEvNRgHhzFxfXB+jXy+RCwTWevFTEW3RH4q51xztrFZYa4Xe_w@mail.gmail.com>
Subject: Re: [PATCH v16 02/20] KVM: selftests: Update kvm_init_vm_address_properties()
 for TDX
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Isaku Yamahata <isaku.yamahata@intel.com>
>
> Initialize the TDX S-bit and the GPA tag mask in
> kvm_init_vm_address_properties() for TDX VMs, similar to how the C-bit
> is initialized for SEV VMs.
>
> The TDX S-bit is used to distinguish between shared and private guest
> physical addresses. Its position is determined by the guest physical
> address width, which is either 48 or 52 bits for current TDX
> implementations.
>
> Co-developed-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> Co-developed-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

>
> [...snip...]
>

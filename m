Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254506;
	b=Tye8LeoSC2MaJd5rIOE5R48D9mV5TR/xLkBJQbpsykt810gMK5rfHLhHJz2aZfs9JA92
	 qRlONoi9wtPraeQWhefzC6vYKZxXepYq7BEuAnDKWwwS9LEU+OFP/7jrn1YzMVIs1p8Dz
	 lamXGQsMYwNxugYk1R3MWiryqcVWxDcKxJ7Hh87PpJ++kh4Y/q3Fiht7WjIf74Kbgzzfr
	 +aVW7uDxEhIAHBs6zpPoyrjVykUaxHxOiyG50rji4VVNIknlILkPHS/PDbrjlxIxnjfK5
	 LrE2Tc2+y0RX9M7YFxBbh0Yfvx4BaUwDRLehL84OpdT2PlueVNnsi+rMjFXQjuudHIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=J4VE9jPLkx8Wgxv9dqM+38TTLHjiOxYTXAGaI9TvUkM=;
	b=ozLKW5wzSHqJBOSUZZBh8bJXUVAwVQ1dRywZCnxBWV/8EpiyqKShtbgLWRRlfdRXE0SP
	 9VnCwxqWxlchpF9YQ8n1mxmmyVXGC4aFY+MCMg3YYf6DUckLlO3iGN1AO9T6A5MuDVS8U
	 BXfnoCOgGd2udtj4Op6dipE8S6om/y/a2pohq0O4bO9UbTZuydh7ZIqzMeBJroFUPfDSt
	 lXgfiLzQU+3Vso+KYpbnZKtLaIn3JE1Eu+1DOzkJgIplLVBfcBJfgCc4MsadMbbSNuvXa
	 KkPUI4hbkLyw1um6TXAbIvZU1F0FF6RBJZAKpYgIck9LwDreXqJlxA/WxlY/vPcPzcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VVPYRW4J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F41606A325
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 20:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F41606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VVPYRW4J
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91eb7d1478cso13366776d6.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 12:01:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254505; cv=none;
        d=google.com; s=arc-20260327;
        b=g1Dd3VK8zWQ6k5f80TpcT0DyBjDJr9iPQsy3okrTwnPROQvJH+CLD99ouQPCuW/kRl
         8k+wYzo/MXZ1m1/xNxZveUP68qGCBWIhNdpoKsQ71XaSg6UY3sZazf5cQF/jTy3y3a61
         tlMq+mUZVG2gfj/JmvKnnPU5xgcmj9LvZ22b3yPU3re/ReGD2E/UWTrkAxuEUlzRkibD
         eAdlPQ9q+afSJR4Oq15jn+zru3GdFqpATMsjL/XzENyiYwLz/Mcesh6Bst8jupfFolLR
         VPswmfjX8YaJaeusI69gUHylGsvllxoRHJcHo92C1USEN9xLTYoIHvt1rtNYscyDZ2NO
         yfQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=J4VE9jPLkx8Wgxv9dqM+38TTLHjiOxYTXAGaI9TvUkM=;
        fh=Jwcqkxj1KxsWPFsbn0IPHBz0WEVqXJFR6XTURqdDR7o=;
        b=C1ZDBd8dNrghAO+fKsoijYbgnHrw8zidB6Buc2U/zPiOC2N++UQJyA83ugM8ciVPbv
         SmodVkX0Ap+fgw4GEd/HBb1y9JA5i82X2KIMbmdgAG+5D3c3Z4Mmag/569P+pO4v3Iyr
         4AQuwUBCU92/rZvA7zN0NdPV4oMqdx6Z+A4rP3zZicvcL2QP/Vrhw+MKF4BzfvI8Z4Hi
         /+JdqQZDWfFNa5pG/1MoUiI0cheAC5FLKj4EJx3RC7rULjrk7BxsDbmJ4swisv3mruSR
         tv6EpALPideigRknz56qe2b+g0RvcLswvf5WA7N1rOu5qqboISyMGdeZzZ/xJCMn5BNX
         VFiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254505; x=1794859305; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4VE9jPLkx8Wgxv9dqM+38TTLHjiOxYTXAGaI9TvUkM=;
        b=VVPYRW4JPvKdjZtMe60xViJTU6BBoc2rCxcc+xXkxgWvR2IBMqJdLO9vMfmCodQgi2
         LGdZQhiKlhxEoMvzgVUZ4nhj7VowzBl72y9cmNHm+o2uZmzMVEg0HyCOT5yj2bbO55hh
         ZOr4VijaX1waBVZ1yPYmALNxxoWgCRVkceOUN4uxRgNQlYRiPD4ziOKRCYrqLawMAQNH
         UQiD8UlIRpS2xubC9lWbVmcz23NYznk35FfNHKS+NUm39MjNGY8AkxFReM/KMJrKHrHA
         6TKwrtxjuoEHCAjmZuEt8vQBDdkcr6zAOf1Edvi3KSYbgxUXL16UaEl9Y2kJoG2MHM3E
         BeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254505; x=1794859305;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4VE9jPLkx8Wgxv9dqM+38TTLHjiOxYTXAGaI9TvUkM=;
        b=UV/jMj2fJLNQwPsL8hat4QOyUju3Sn4KcsMziGtoMHPb52CsgckcYqBQuxaFPp/nsC
         xi3Nn9ej5bhnbJg+Vatun+PAo+F0jDh6Vz+NMp3bpKewL/L0lpK0y6aIHk9/aq8sgcQF
         u+khwYbZKMP/7WMGvLVgltplQtZec0mzIisQKSksmTp6AV4fmywkwzwIN3gMbVoSM4KG
         D/0IqhCHbZB/exkATiqvM3w7Vck2m1K9fVJCklYKl1nR7isuzVjRn8/3JhW9YkPbWrZp
         w546BiqS2sZS5b6NJPFORJ41vbKmcPRCeOenoBE3Qr6M4Onyw2oZKvOU1KlynFwwQmyj
         GP3A==
X-Forwarded-Encrypted: i=1; AL+hErHufeb4qgu4HM6qXfCkL5UxS0WVjzWJIFN5ddndD7X7wWZK19ONHQmqd8fh/x+jsa8OWPeQf7ENeERcz7loTdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qdgeImH05VM5QzUpGxU3HWpWsytVS8TdeCHBHmTYmgUPt7lK9
	Fnou/uLkeMmuWzMb2uq84XL/8QhNyGDpEYt1oLV3P/5TneUEbE00YTYH9P6Z2XZXp2YE3dwzSjK
	gb5lLpLWgUr5+iHXbdK7PnCp2FJtUd9z66gIbeERI
X-Gm-Gg: AYBFou0K7NTWu51cVjn4rAIV8BmoZOu/kqjULyk2wzlNVPOds/DtGUqhrura+E48CPw
	0CmyF0WsJN9JzKipLVvEXRAfGfKEfdaIrYNQy15l/GEyqVHwVr3vEi/csaKUEdlFNlyQDeUQBGi
	97r3RzJcEgcQZnrnl8H5jYbNYaFZBkJfJL9TwO3MJ5ss1V5SpovDBP1Fq017UmNFWDtlypvbpGA
	J0ZK54CKztIhmulE+jQ7r4ZTico8cvyHBw4vSbBriIiOigYTvMuL6/XlRmu6WzUYxLQBTSkZsVQ
	hxRTo5sTe983wkvaeaAnlpuZkm2oRlLZJkBkyr13m10DlrfP3p3H6z4w8Od9OThkKgInH6iNdoU
	6rfehBSTIf7DpUck3XtPEBjxCyXPzcYaAqfMBXZcmUbe6Idm8lwLqBd5j6agaueDhBaf6+3JYth
	ixhuY80+6MSCtZDSOCGko4CzPAR6/z5+i/rp0pXUAhJnXX
X-Received: by 2002:a05:6214:1d21:b0:91e:9664:4e2b with SMTP id
 6a1803df08f44-91eef7a3c83mr11947696d6.7.1794254504037; Mon, 09 Nov 2026
 12:01:44 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 12:01:43 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-14-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-14-2024e8fa517a@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 12:01:42 -0800
X-Gm-Features: AclHuK965yyNFO13V7bpMX0YP25CWk-grxkHlMzQ2EkXDGXWn8vJSUwM5EQspQQ
Message-ID: <CAEvNRgG4BGkr5QhNaOQrBLzGp5uy7Bc8Lv0c5a5tp5uUr047nQ@mail.gmail.com>
Subject: Re: [PATCH v16 14/20] KVM: selftests: Set entry point for TDX guest code
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
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sagi Shahar <sagis@google.com>
>
> Since the rip register is inaccessible for TDX VMs, we need a different
> way to set the guest entry point for TDX VMs. This is done by writing
> the guest code address to a predefined location in the guest memory and
> loading it into rip as part of the TDX boot code.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

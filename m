Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331944;
	b=xqCTsOTLdeNkKJNi4bRxPgoxXhRuDf1MnrfQAMxJ1x/YTlzYMcQyM35PHhhfd1dmtcbo
	 2V8jk279E5bLCCfVXdwPnO5H7yvnT5Gcz0Vmjr7hFgIEUILVp3aoEV9fwznkRGhDS6UoW
	 QW54oJkRDBMyiGMiz3IQXdOi43Gc9MiPlFFY+m+qTncebmn7SgJWt5bjgJXzS8U6KGOcY
	 pjO6ryrQzyM08reSdIUBCE/P5BDTe13Crb+h6kjRyDxWhjkEQgKT4YVU1Z2Ru0RwYljAl
	 10LZe7gULknkuLIT0MOgcgiBCBE9FKHofcgiIT2wf1eqRjv4Hz8ki7is2+2fQrqeC/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331944;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=O/wNfj9zcVudY5TorfEHZYOP0zrjBm5k7fCeb1ImJL0=;
	b=HKgwRpT7pgOLmW9CJl4etowx42Sd9TOUAmJpRuHIM+2Pn8EWuLWAdtJ3uWSiS13pqoT2
	 IW85kPFRzKRi3R02jveaW+lC7dalcs9out7VBdUeilG7pFTpRcQDvK3umEIYM9svHPvPl
	 Qr/py6jTBWEiDypFxFUdCqCGJDqLhEaUzYsmwIzJcktSTeDcnVeVfijcy2dliXBy60UOi
	 s0F5WSq4CAfR04liT8MOdDpctBZHr44gwEVsQ/npwCMMokKqGmcNYRc805ueTdFW/hfPF
	 AnuQI9/hZkFqzFYT0/L90IlBE735ockxlqgz2Z5fSWXy7OlZE59K3q5OjVBgR8cp+2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XOv3DBb7;
	arc=none smtp.remote-ip=91.218.175.223
Received: from mta0.migadu.com (out-223.mta0.migadu.com [91.218.175.223])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BAE606A320
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 17:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14BAE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XOv3DBb7
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=O/wNfj9zcVudY5TorfEHZYOP0zrjBm5k7fCeb1ImJL0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794331942; v=1; x=1794936742;
 b=XOv3DBb74Cf4TZgvyKAttfRt/iWRlihuvjHeqM/WSj6B6M69yj5UG33EYJJyf92KOiIq5zmm
 zluO6hTo3cfBuhXqOTm+HCzSdvRTblPGZgPBP232F5x8vlNJeFWFzcqnkeFfHUTh99EEDXjsWd2
 Ztp6eLryQCu/nCHDypEUzsFQ=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7132c504857f121b;
	Tue, 10 Nov 2026 17:32:22 +0000
X-Mizu-Trace-ID: 7132c504857f121b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so12795e87.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 09:32:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHZ9Vkj7f9T6hPxEYg+VRNHWimE8UoM5YxGF15mEqQu8BhXEBzzTo9OU4atm4I4FG0ys5IZFdBnKj5M2SZPLaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BnIItr9oKFf3zzHTQU5hIJsyo3OxURbN+H4n56hcKgrQfGb57
	wmyoKgL9AQXtBOMM+AW+9ex1kG8MdZsP2+sPl/iZG4R7gwjfF8YaM33ZcpYEyAv9262Wuskxo2z
	3/ALrzQfM4bmDitErYGzcozM3DFkV3HJD0nJET045
X-Received: by 2002:a05:6512:1052:b0:5c0:7c6e:4559 with SMTP id
 2adb3069b0e04-5c157db2ba2mr166549e87.9.1794331937194; Tue, 10 Nov 2026
 09:32:17 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110110724.3614412-1-fuad.tabba@linux.dev>
 <20261110110724.3614412-3-fuad.tabba@linux.dev> <avMoubwqgXbpflwM@gremlin>
 <CA+EHjTxT_9NghyLSZmOOi_oQboQw-g+6z9WxwaF=-7RdaGbMNw@mail.gmail.com> <avM9i8xWNZ2fU8_2@gremlin>
In-Reply-To: <avM9i8xWNZ2fU8_2@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 10 Nov 2026 17:31:40 +0000
X-Gmail-Original-Message-ID: <CA+EHjTw-t85cJcZChnuEcTboe9FbLmvFXi+vn3os5N49R-z33Q@mail.gmail.com>
X-Gm-Features: AclHuK9X3Qq0RyJZlRjr_WD8VHNxqnjWuSAxxr9VQ80XC2fWGGeURk5VvSDZtkI
Message-ID: <CA+EHjTw-t85cJcZChnuEcTboe9FbLmvFXi+vn3os5N49R-z33Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Test KVM_PRE_FAULT_MEMORY against a
 full dirty ring
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 15:57:37 +0000, "Lorenzo Stoakes (ARM)"
<ljs@kernel.org> wrote:
[...]
> > Yes, the acquire pairs with the smp_wmb() in kvm_dirty_ring_push()
> > ahead of the flag store, and the release with the smp_load_acquire()
> > in kvm_dirty_gfn_harvested(). dirty_log_test does the same.
>
> I know it's test code, but general kernel practice is to add a comment saying
> what memory barriers pair with so it's easier to track, could you add those for
> these?

Sure.

/fuad

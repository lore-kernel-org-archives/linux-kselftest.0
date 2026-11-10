Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331792;
	b=SUm/0cAs4nUGj6wuq0TZ/oJavyaU2xtFF4aVfkPJYqZUkNgVSRypsYSqNQJnu/CIn7XK
	 TttrlFS0WY5SIZ8dYfAyIPE+EuQYnYqLxEwkbmWgBazvJK/99UOLWAKH8mdO3KzIVMv10
	 RfxuOXJRKVZAnx8cYHraKaTW8wxg6s3kghJUNfuB+7Hv82BHTHHZ7KmQouh623e8Oznu4
	 k85GamQ5NUFDh6QsjYfdzRkatG7yd1VoArK+DuWzEVb3PJqfrA2TUPBHjNPFm+dLZvlJG
	 DMDlM9gE7mq0s+Za4+nHycJqZAjNouiZSkP3Fr3LsZWJQq1CLwmdHcsVrW+tfO6XYjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331792;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=5wx+HPVDzMK2ZNFwmp4IvNdPd/griQf8bcKEGlkTO38=;
	b=nQPC4quxAuyYYU2HxhxSk6VWIVzeyAAmcwKsD74zj+/kup+qh7Zun25NjyMhSo6TcCDQ
	 MCv9wuzI2OxfNFNUXRZsAyurjE+odq6JuLuxYTYNcE7I4TlVXOnygJJGY2iDshIYO3d4y
	 BxzAuUVCwCWCeOYIA4Q0s625wOU0E+vAE74xdddtAPjVe87BmSMfXI5m7BsYkih3Ri3O6
	 2anWHuCY/pb6nb6SHaeltvDKiHt48WG8xdabWvJ5sjjdX/FRar8BtSHyyE+YcrYh4fdnW
	 QKKjKr15UyJtbbVcSVwuv9LMeqz5F0PL2klA8wnZxzp0UlGuIucKx6exUQBpgy290Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R7tCCwLw;
	arc=none smtp.remote-ip=95.215.58.201
Received: from mta1.migadu.com (out-201.mta1.migadu.com [95.215.58.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6654F60A2607
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 17:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6654F60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R7tCCwLw
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xgvHwTGa+PgFPe0I//hfxTTphupF934nrFHnim+v1LA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794331789; v=1; x=1794936589;
 b=R7tCCwLw2Vh/txizb9XBhym+9qSBhJD1ScanVGI5NNOQTNyPDHwUIzGvjlRT5nrAwBGkr+Y0
 npzHZeFQcKLnHjTycKQ4GQVovAUPvYJrg9d87NXIuySH0ATwTw11KccxB8xqWED3tipRslrTTv9
 k+0Thxt7liDSTDmdyeXxzc/E=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b49efb17eac9f713;
	Tue, 10 Nov 2026 17:29:49 +0000
X-Mizu-Trace-ID: b49efb17eac9f713
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so12735e87.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 09:29:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHMiEbtGrm1iTCLPlFbNPDZ3kmhXuVSJZpPtHYIUYRHUnqvtSxSTT8o4S4I4C0OG+WlcyJqhvZhkwIShYIIHkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H6qJHP2xmTwyJePNs2MsTWzRIKyAtAtNijrK05JmDwgtVhPJM
	MMlRygcofurvZrAMQHAGlxS/GrQODPL/4j0pGWY9EohMOZp1UK9WIvIzZsxJbxbmwAZYU5G0C2Q
	35iTfd7iuQnK3Zj2yo2wlyCPg/LJxhwO+VYXM8w4l
X-Received: by 2002:a05:6512:33cb:b0:5bf:f81a:f24e with SMTP id
 2adb3069b0e04-5c157dba643mr143671e87.10.1794331787336; Tue, 10 Nov 2026
 09:29:47 -0800 (PST)
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
 <CA+EHjTxT_9NghyLSZmOOi_oQboQw-g+6z9WxwaF=-7RdaGbMNw@mail.gmail.com> <avM9_7aWUDJSL3Lq@seanjc-mac.roam.internal>
In-Reply-To: <avM9_7aWUDJSL3Lq@seanjc-mac.roam.internal>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 10 Nov 2026 17:29:10 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzS-=5kKVLD2tH7cvHJXK5UrMkHwHt43oGTz-LfgwnzEw@mail.gmail.com>
X-Gm-Features: AclHuK_8onLfxAou1vV3GX8Fp1YuNIw5KxweJ38CdU52leAU_A1H9EYmOqgJEWU
Message-ID: <CA+EHjTzS-=5kKVLD2tH7cvHJXK5UrMkHwHt43oGTz-LfgwnzEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Test KVM_PRE_FAULT_MEMORY against a
 full dirty ring
To: Sean Christopherson <seanjc@google.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, 
	Wei-Lin Chang <weilin.chang@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 15:53:35 +0000, Sean Christopherson
<seanjc@google.com> wrote:
[...]
> Before we effectively solidify the behavior, I think we should have an explicit
> discussion about the desired behavior of KVM_PRE_FAULT_MEMORY when dirty logging
> is enabled.  E.g. the only reason I kept the existing behavior in my auto-prefault
> series was because I couldn't think of a good reason to change it.  But we never
> made a concious decision in the first place, i.e. we never considered what would
> happen if prefaulting collided with dirty logging (as evidenced by this bug).

FWIW, I'd lean towards a pre-fault not dirtying the page. arm64 (with
a dirty bitmap) and riscv already map a read fault on a logged page
read-only.

Tried it on x86 by not mapping a prefetch writable in a logged slot,
so that the fast path logs the first write. That also changes async
#PF completion, so I don't think it's a stable fix.

The loop has to stop for as long as x86 logs, so should patch 1 stay
as the stable fix? The test skips when pre-faulting dirties no pages,
so it doesn't pin either behavior.

Cheers,
/fuad

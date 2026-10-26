Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002906;
	b=VuJhh2es4S4yntIGVuG4+qaBL+1P82JKTEJd5h6SJuBQGtJqYBEW+H7Dc9yN3ffsw7fa
	 jDuK54r4oQnbJRQuS7BaHLN+crGG5Ns8sGFgluVpu/C9O2ytVE/6zX/gmBw7supz8u0b8
	 mpyLMyCKsGXhUUlblVveGohA0WGmLcekpYwPtIgDDjdvqCXHGWSLlE2AH+3EwFff3Lxn5
	 KtW9kSejSuDb8m+ooOHwH0nj66rci9ch2a3j6NUIMJ/Nv+YU+eHg8PseX6l+clNJQZ3PB
	 1qJQvw4VST/s4AhsDbqlR2Xjixeh/mULvfXnP6zToZ19tGmPvn61CPjLk/ua9m+zcow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002906;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=HeN8sKTlUL/VwaqkACE76c/cgf/RcKGyONBxScYlrEc=;
	b=j5N6V51wluB2hWW90iPPmVTW552jCKXqkuOB5p+ca8KKsU6Lgwd8F13zgBGwk42O+7et
	 XWzRv23NBxcIH44/RFzGOV7f8Q9tahhRJN5UbiD8ItFf5pX1WmetIA/RfZFw8K5gDL5Nr
	 DjEHt0dMDCn3dhpM7OeFNyl2cLGAk+d1rQlfBF1sErZMojur07cy8aWwRlZ7ABAmAB8zz
	 qXGZD7NkAFbIqRt/lKqFchq9RGyDpK9xB8MXwA/89G6wFeF+FLAe+rR5u075Ph4hCr8by
	 4/KD6CGI8h21NR50QwqFc6QMjMI39qutOSSBhtmgIoJ2Rtm8Pj5pZD71nqeVE0UfeGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ePy+OAyQ;
	arc=none smtp.remote-ip=95.215.58.102
Received: from mta1.migadu.com (out-102.mta1.migadu.com [95.215.58.102])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C3B606A325
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 08:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30C3B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ePy+OAyQ
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HeN8sKTlUL/VwaqkACE76c/cgf/RcKGyONBxScYlrEc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793002903; v=1; x=1793607703;
 b=ePy+OAyQieY0itXvVPp9KFQKDs1Ly/rECC7pTQ7tFE33zk6mGvDad60VIQqWRChm5/mhItbQ
 EPutmt21/hvSg6ooW/uj0BkQNnFLJVhiQBLPeUvtUlyb0fMXbqflazVXY454qrzNs1upLKoEtSP
 KFm6DCrM7UoPsTpa7KlA6bHs=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 93c859428215cb35;
	Mon, 26 Oct 2026 08:21:43 +0000
X-Mizu-Trace-ID: 93c859428215cb35
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8610e87.0
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 01:21:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwNNm6w9nH9gLLFnX3h3xgG/6Y8MLLOlYIElrqBCVZE+DBHDeM1Pb5PCzjcRIdozposmlVOExmB42XdILWl2Xc=@vger.kernel.org
X-Gm-Message-State: AFq9FYItUmVeWsghf/a0ApU8s2A7BnHLP1ynIvGw4uA9LiH8/Z8CTXms
	ZLadimEwA6J4iSzAPl+nragLFttbVLd40eoAtlKjss17oUX8tRxCl2Zje6Ie7ZErkbeqHqjRe/j
	ldjqKrEXrFX2ZbgPICMARvxIcLP+GDvw0zZmz7d+A
X-Received: by 2002:a05:6512:3091:b0:5be:4d73:e44d with SMTP id
 2adb3069b0e04-5bfb79db1f6mr139727e87.5.1793002898251; Mon, 26 Oct 2026
 01:21:38 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-b4-vncr-mapping-test-v3-1-7c094a00d46e@fujitsu.com>
In-Reply-To: <20261026-b4-vncr-mapping-test-v3-1-7c094a00d46e@fujitsu.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 26 Oct 2026 08:21:02 +0000
X-Gmail-Original-Message-ID: <CA+EHjTy=bU1ygvgYiwKiWpxP4XTY_QEmkMgW=Bxd1pxyFZ0qdA@mail.gmail.com>
X-Gm-Features: AclHuK9mNQcdy23LyjVrKUw6ZiFaEhEa1RjPtCWEqLpOPj2wxuYrSqZs8yklhYY
Message-ID: <CA+EHjTy=bU1ygvgYiwKiWpxP4XTY_QEmkMgW=Bxd1pxyFZ0qdA@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: selftests: Test VNCR translation invalidation
To: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Itaru,

On Mon, 26 Oct 2026 03:10:10 +0000, Itaru Kitayama
<itaru.kitayama@fujitsu.com> wrote:
[...]

These are from v2, and I didn't retest v3 since it only makes the
changes I asked for. In cases like this, feel free to keep my tags on
the respin.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

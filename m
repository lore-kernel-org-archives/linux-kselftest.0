Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.214
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944897;
	b=nsb3lf1Y3hO3Awmy1MTyt4ywdMk1QXBjZu06iEYk7TBYMJKvgDxYBp5j+UiKU7um573I
	 GMrP/RbRnrQAP/jl86+X029rIjf6RXapQq43Ion/cJ1bdhtCskzmmqMUjzNn2qxYpNIDe
	 dPJp2qskblPjSuEc5jstvZYgjozplDC/8rOjzgl5QqaUEh582qRF+v6c3/nHdJ7CpDXA6
	 IWpBpO7B7JDRpyqxVAFYUsbJ2X4TFQjoxSr9Xz0d37Tv08N9SPguYfj82WKB4IEQ/O7h5
	 xIjBk8eYxAohheJ8asena9eP3p4Lp3J7HrvA4hI8/0AfEnZ+/Tq5sgV9UtZxSeriRpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944897;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=uKJuLqQr75Y+bo8J7GoFF1WkhE7oAHbeqLhg/Qlni5U=;
	b=QkdBWyCuWwx1xxo0c8RnieV6lNhnlf5f1Xfza88m6TOv0S4y+FIxD2AcijjLZaW3FaD7
	 nKbgk1CzVx2AJXBGq+x7zpX7DNE5krw0Mp+7/2BLMUegFRZX/d+BpBid2cz+ccLyq8rFP
	 mFrS+yvxFWS651WVkaBlm8eu1vzwSb5DnO0wFiPVn2hXZHjRwdMZI1iDqyvs3JMpFImNy
	 lntYy7nBMbwOVe93Xp52RbE47ZIMhx5Dm3ewq5s6RNXC+acaqEtTPCvTLtsgLOlEppg1A
	 GANwOBuW15n2pFoE7yzIQNv374xSxk1Ds0f7KDY3IHKxbUVZhkH+ExjBgkJgYiKyeag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UXM8ypuM;
	arc=none smtp.remote-ip=91.218.175.214
Received: from mta0.migadu.com (out-214.mta0.migadu.com [91.218.175.214])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B4A606A32F
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 19:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B4A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UXM8ypuM
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uKJuLqQr75Y+bo8J7GoFF1WkhE7oAHbeqLhg/Qlni5U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794944894; v=1; x=1795549694;
 b=UXM8ypuMZFrmGzxKR0QiG77imGgss9oJ49yHHDBuseqi54SVZz5yE6Kv6q5+jvTtaBK6+E+X
 U00gFoPNePAFkIbhk/x1IOQEUkTx275fdpyiOdYVUOIRiRxzP5fPXBiToar/5oy1DXyqzRN+vL6
 If4hXEAVets2MoyhuyqJxQL0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4137b6685e4fb933;
	Tue, 17 Nov 2026 19:48:14 +0000
X-Mizu-Trace-ID: 4137b6685e4fb933
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso1203e87.1
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 11:48:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHO1J6U3kbje7e75CQhDZvsyut3GGzcH7EOfj2pf8rS9bGEF83FvbbgunmhNd821D2Bc8UTspfR5Y+bKy3EyyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fjvOy9Agjd4b0k6qgEzpabiLZKrEhMwCTZMpJBHOCf8BcnSaX
	3gnU/SmVBJAFpajfKbaOIGqsjp1kfpG/yeXF2T3oyYRQn5BYmdPwSORKx7GXQLJOdV1bXJkLpQg
	oyslQZmIBB0sD8QqGBiFDGYzIHtr4O69nVkCGcCZo
X-Received: by 2002:a05:6512:2514:b0:5c1:488e:a067 with SMTP id
 2adb3069b0e04-5c1a21b8c88mr211122e87.16.1794944892940; Tue, 17 Nov 2026
 11:48:12 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109084854.840576-1-fuad.tabba@linux.dev> <20261109084854.840576-2-fuad.tabba@linux.dev>
 <86bj7n1bzx.wl-maz@kernel.org>
In-Reply-To: <86bj7n1bzx.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 17 Nov 2026 19:47:36 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwJ9XTCfrfBLgGjed3GrRtiTnk-ErvPSwU-AhvyTVcnsw@mail.gmail.com>
X-Gm-Features: AclHuK-8bTfTjzWgE2se3igLLysfjqAzQV8BoEmKuQlaC_gyenaFOJ31_2y-pYk
Message-ID: <CA+EHjTwJ9XTCfrfBLgGjed3GrRtiTnk-ErvPSwU-AhvyTVcnsw@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] KVM: arm64: Hide generic ptrauth from protected
 VMs without ptrauth
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Tue, 17 Nov 2026 19:41:54 +0000, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Burying a fix in a selftest series is a recipe to make sure it is
> ignored for a full cycle... Why isn't that with the "massive feature
> set" series?

It's in this one because pkvm_id_regs depends on it. The test checks
that GPA and GPI read 0 in a protected VM without ptrauth, and it
fails without the fix.

Would you prefer that I send it on its own, or with the respin of the
features series?

Cheers,
/fuad

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743465;
	b=0cfxqvOml9Y71pgvrV+EGJBe55YEoLCxY7fkcCtx8X3yr9V9jkReOrk4EWYajVgJSgz0
	 3umHPQO94RVCubGa9YRtrtlZbNFxHxuDi5boOmba+Q1whUlmTeemYCHu1JOeCUQbe+2Hd
	 mlVGDEM//hLulJBAisp0mxOvF+NODAfWeRM3mdrRsQCeA+SJJ8JfNEhfJZ0NOjO6spuQY
	 sxoWaAFNltB7O0exjm/nuNw1hCyAFj5D6ia2vkn6C8+CS/liOVNhQ1lJa2HnUAvUqlKT8
	 NWtD7uzRXcX6eGCE9ZVXvdyxcXC5Sq9FrPD/Ovn68yCjcs0Sx7V2OHJAenQ3lWnDWuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743465;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=qNsB+WdeCj5VypVcxsMZSCwyt6cdxmOolUo5Fs1wHvU=;
	b=yVihJw1FuIjukOjX3Kb6OOG879iBI3KeCv8c46OFy65G3GvJcmP/W9JZCNE/T1hTA2DL
	 lq7n4NfRlLiEFlfrkbntQ5e72ZdCsNavvYCWaDC8wTd1VxOTV82t5nEzVN1RUQgngowHT
	 tO6Q6msQ44p+JE/9dUJqpTvaXlO4KCC6DY5h0GSa2zUfvRwdyQhEE8BOOHIBmvpgXox8f
	 QzekfV+bSnZKp0kwXOdxW1f6Pi4PXPjiSf7AocfPnbwZMRASbAQ1RiBtFEQxd1F3Vd+G8
	 I7TCbaa+IKXZVWvD842342ICQNcn3HirHH9clehhosC14Uvj5CMdJ6d68GlBU6niABg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xXkZ1C93;
	arc=none smtp.remote-ip=91.218.175.143
Received: from mta0.migadu.com (out-143.mta0.migadu.com [91.218.175.143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB676606A326
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 08:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB676606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xXkZ1C93
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3q8FYPFV6/mr5bsm1f2R+ib1owIqgidysonIiS2gMzA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792743462; v=1; x=1793348262;
 b=xXkZ1C93sH0d9nWku2jz64eg86LFtyD4d+7g/hRHlLSjdd1CGo0g9kZlOh0/2zXvF+uMu35a
 yWJ/TDUx0k8lZzhhzewjugIn3a3T5tmjlDAlw8oZogN//DQLAKM18yj5LibgvlkdjQ9Fo4jN/VF
 X+/09nCL6CsM4gCFs6Gu9JtU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6339bcfde15bd1cf;
	Fri, 23 Oct 2026 08:17:42 +0000
X-Mizu-Trace-ID: 6339bcfde15bd1cf
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so5876e87.0
        for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 01:17:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzK3X+BMQIFWT0R11PCyNljO3xMOwRwwXdhoZlIIav0feJ4fULNOR17rV5xKegbGCZITQpSDNUYI93BZ3T9IwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK66S3ddw6w9B/s3axTSim1/sQO/BLeR638LhEy/wvkhZGwNs3W
	7LfDJibh3Mit5dqLOpfn/hY7f57ab+Uel3nnk/uHtDLWl6I3wnyMo1SIuNXIb4CrQjObqXL/qJx
	5ibAyi/rQxX8uqqcoDcGk/5lSmhOcGzb12bCOgYig
X-Received: by 2002:a05:6512:1111:b0:5bf:aeea:6e42 with SMTP id
 2adb3069b0e04-5bfb06d38f2mr78643e87.8.1792743457929; Fri, 23 Oct 2026
 01:17:37 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022-b4-vncr-mapping-test-v2-1-033e63ee055d@fujitsu.com>
In-Reply-To: <20261022-b4-vncr-mapping-test-v2-1-033e63ee055d@fujitsu.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 23 Oct 2026 09:17:01 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwoY0e6oaJoQg3-1Ns=RVPfdACAaVuJE-_DgLUHhMqg9A@mail.gmail.com>
X-Gm-Features: AclHuK_ZP2kPcYLceD_8xYePQ21UVh1ALRPCnQDdUQxEW_qnQ2BndoyxjgDJICM
Message-ID: <CA+EHjTwoY0e6oaJoQg3-1Ns=RVPfdACAaVuJE-_DgLUHhMqg9A@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: selftests: Test VNCR translation invalidation
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

On Thu, 22 Oct 2026 09:11:18 +0100, Itaru Kitayama
<itaru.kitayama@fujitsu.com> wrote:
> Add a standalone KVM selftest that checks VNCR accesses after L1
> updates its stage-1 mapping and issues a TLBI.

Could you add a sentence on what this guards? KVM caches L1's
translation of VNCR_EL2 and has to drop it when L1 invalidates that
mapping, in kvm_handle_s1e2_tlbi().

[...]
> diff --git a/tools/testing/selftests/kvm/arm64/nv_vncr_tlbi_test.c b/tools/testing/selftests/kvm/arm64/nv_vncr_tlbi_test.c
[...]
> +static void handle_l2_hvc(struct ex_regs *regs)
[...]
> +       case 2:
> +               /* Check invalidation again, with the mapping reversed. */
> +               GUEST_ASSERT_EQ(regs->regs[0], WRITE_A);
> +               GUEST_ASSERT_EQ(READ_ONCE(*cfg.slot_a), WRITE_A_AGAIN);
> +               GUEST_ASSERT_EQ(READ_ONCE(*cfg.slot_b), WRITE_B);
> +
> +               GUEST_DONE();
> +       default:

Could you add a break here? GUEST_DONE() isn't noreturn, so this falls
through into default:.

[...]
> +int main(void)
[...]
> +               case UCALL_DONE:
> +                       pr_info("PASS: VNCR accesses followed A -> B -> A mappings; "
> +               "inactive backing slots remained unchanged\n");

Could you align the second line of the string under the first?

I ran it on QEMU with kvm-arm.mode=nested and it passes. With the VNCR
invalidation in kvm_handle_s1e2_tlbi() disabled, it fails at the round
1 check, so it catches the bug it's meant to.

Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

With the issues above fixed:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

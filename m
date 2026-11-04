Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793791943;
	b=Y+8YhNVqG5tsCFEKYjkuNQywCIEd2S9ymRqaZhiCmqqNaR7XEdYnKREod54I6GQmYNKC
	 7x9kLyto4lUZ/iRkQth8sClwpIaqgP3FjS1QCwZTM8sVVq45n9PucKaCXO7fmf4ATxS2Z
	 zp0plX7aTsrTYIpybujxx4GnRUnav55t+oZu7fAhjSa/rx1AIdFCODt5b6k4opJuCO6Sr
	 jYesekvkklgeQ2+Y7e//q0uPWLTssVp+LgzKlY4TJWPkToFVYc4ZLtu7508e2bdHtlAvL
	 Jn4GwZB5cy4aIlESzTOBcRxP82PpClyPRW3Rn0OrFvFjJB34V/srsyX2vjjCm2q+dzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791943;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=Sn3eSe67w3OleW5NGD87sSVusifSp8lGeY/kfZic8AY=;
	b=BE4cj22YFiJRMtxNi12Sx4hjPBevzLxgvmL4E9RFB+1ditbE2WXDkfasGFyX1A6LFlpP
	 27NraHmpo07/0kyPzIa+3dBN2qV0PpHzDMoOlBInoex0hiU8ovzt4be38uWw3PXjjyv5i
	 3NBOVPcuKEd9oA9GJvRpRNhrBm9SU4eBprWX2tHFem8RJbj3P+DtZJQWX2vgRj1dUZl1V
	 wuuquaaIHpFooFYgO1kOKEsWO3O3gHYAkhBgMILQUi2E5T/L6snv9VYYnOuHQGxppj+Xb
	 WUI8p3HkqQg3zQKAThxVFaj9iDcmms+OmSZEFqTOdjaBdfrm+mUv99fN04AxcPUI8cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hnaGrckW;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Kmiu6QeM;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7704E606A32C
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 11:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7704E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hnaGrckW;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Kmiu6QeM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793791941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sn3eSe67w3OleW5NGD87sSVusifSp8lGeY/kfZic8AY=;
	b=hnaGrckWRQ5XfRnUO5uII6yiMJabXlmUhVnruw0jL6Xm+PNoNt6PHpXFIn00bbPC3rnAO1
	skc+sxKcq6uLK2QEynoccIdYeHpwnGZcV66N6J+FzCckO1spsC8/B9p9I42k2hUbO2FpUB
	Eggy7yolZRcVQS2ecQUOl65oY+ai3Oc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-3iDlVOSvMMy6EBccawDHEA-1; Wed, 04 Nov 2026 06:32:20 -0500
X-MC-Unique: 3iDlVOSvMMy6EBccawDHEA-1
X-Mimecast-MFC-AGG-ID: 3iDlVOSvMMy6EBccawDHEA_1793791939
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so6931835e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 03:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793791939; x=1794396739; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sn3eSe67w3OleW5NGD87sSVusifSp8lGeY/kfZic8AY=;
        b=Kmiu6QeMLUsGlfnpigZik9Kqb33N5OTMRMusjT4I3PPN97mFuIPWR9tKcCVH4QJD9Q
         PTXlPF32K3wO3c+fEWwSkU7I5atSdFhslxoVoeYKfDUv6b1ch4UbwryW7UTk0lwubeEl
         lADRMHj+xnH9orRTaGmcwAdluhOJkYGAf9nLAjH84z4vFrQiTYuN+6YpGjQob/W0cgWh
         IWrgQAApkSlgSNWFPLXwa4urf7WqyKFUE+/EM6i3TolcGBBt7kYLCsxjc3bYSQ/lJLbu
         j7sc60y24+bWH/4vGxQEzMOuwqDrNg+kBhwtASABIVV3Vfw6CHBkIoW18+7EoN/MhZnz
         I4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793791939; x=1794396739;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sn3eSe67w3OleW5NGD87sSVusifSp8lGeY/kfZic8AY=;
        b=bhQRCtGRbUvz2+KfIMlMqn+RI84BeIyLCYicxeKAUOdDKHjyFwAlxdsgw0sbK9Sl7P
         LjZVW/YuLJ0HG2uMLoQ7Sc6osrjyiOhmbyGTLaliPdSMMEuW/raOx9lfovW5aL7797jF
         NFtBR8cskhm5QKtJta1wTFr98sqwSf06xwT7xVA3X7owLhjE8p+uwq2YrmxduKj9kkMQ
         TS0+6D0M7SphmaAQfELISn92AVAisZRBbwak0eoK+raTqtYbFKIBTxcNAknQF++S6qJG
         8bexdJcz+lKAO+hChjyCcQsgXHY+t6MINp3mUed3JCzX+n+NCB1eLGmehhgiRbggx/tg
         sVuA==
X-Forwarded-Encrypted: i=1; AKwUvBz6lUXJvVqdMYyV9rmPidTP2tuugohW5T08lJG6kVgKepUU+qOQn8c8aXrGcsB0TiwlZbyUji/KGuufGk//sb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SIURJeXqxwuobHw0QMSun7dkMkv4wmTCkePXt7s2XoQixjNkk
	lkz+VClSCqkeCu+qo1nUhFD1DxKNdBqiaL1bsSi4WJbdm4m8j+gb0uMKrta/u3o7UhnT1pWsjb1
	N3XtUwnfkKMFPF8qxw0Ea14Yecp+MaY/9+1Y8rKF8e3clS/zAUomM8sxNflolpYYiAsqrRw==
X-Gm-Gg: AYBFou18gV+rJnh5rvI60R2kQalWh9MBQYX5fvShrJDC9bi/oNNO9gOPomlIcqb+DD9
	95SjKN+73kZ1a/5z5O2TTEwUw75QLlaySK6BJ0W4ynYSn0EKeW3Ct3o7YJOmoIKwn+mjrOvNF3o
	fXv9arNB6rcPPTq93n9LI8iHhktP+4ICp19Ixnkfs4fIxzXuL81rAuEFIckHGCyGQRIrkqSj9xe
	x0TtEp0v+OD+4rdzLaVEaNxQh7ABpotgCdnPYrJi6Ld1duR2SLbliMlAq4zvwJIvCehFiXgLSfu
	nQ/1WmK9yFIXtdNVR9wweU+/rPwPacuaZTOSECAHVMkfem3CQ7YgadwdSfe7F87KALRAcWyaXl2
	amMty3CRyZ35BmJ61JQSsqJk+iSGpwAdzQy41s6yYF81kxfokWMg4Q6pB2NGMGnUzf/PMdCkT4M
	KleBNObN4OQhvHqtDylgSyS/6OvISjsfPDrWzIKA==
X-Received: by 2002:a05:600c:4e02:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ac19705e02mr339637905e9.32.1793791939102;
        Wed, 04 Nov 2026 03:32:19 -0800 (PST)
X-Received: by 2002:a05:600c:4e02:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ac19705e02mr339637545e9.32.1793791938760;
        Wed, 04 Nov 2026 03:32:18 -0800 (PST)
Received: from seott-rh (p200300f6af1574019b2c5947d8ec139e.dip0.t-ipconnect.de. [2003:f6:af15:7401:9b2c:5947:d8ec:139e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm60945795e9.3.2026.11.04.03.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:32:18 -0800 (PST)
Date: Wed, 4 Nov 2026 12:32:17 +0100 (CET)
From: Sebastian Ott <seott@redhat.com>
To: Mark Brown <broonie@kernel.org>
cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
    Oliver Upton <oupton@kernel.org>, Ben Horgan <ben.horgan@arm.com>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linux-kernel@vger.kernel.org, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v9 1/3] KVM: selftests: arm64: Report set_id_reg reads
 of test registers as tests
In-Reply-To: <20261103-kvm-arm64-set-id-regs-aarch64-v9-1-ab32bc79fa9c@kernel.org>
Message-ID: <4df3cceb-0d07-d787-b5b6-0a28433116f3@redhat.com>
References: <20261103-kvm-arm64-set-id-regs-aarch64-v9-0-ab32bc79fa9c@kernel.org> <20261103-kvm-arm64-set-id-regs-aarch64-v9-1-ab32bc79fa9c@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Tue, 3 Nov 2026, Mark Brown wrote:
> Currently when we run guest code to validate that the values we wrote to
> the registers are seen by the guest we assert that these values match using
> a KVM selftests level assert, resulting in unclear diagnostics if the test
> fails. Replace this assert with reporting a kselftest test per register.
>
> In order to support getting the names of the registers we repaint the array
> of ID_ registers to store the names and open code the rest.
>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
[...]
> @@ -684,11 +719,20 @@ static void test_guest_reg_read(struct kvm_vcpu *vcpu)
> 			REPORT_GUEST_ASSERT(uc);
> 			break;
> 		case UCALL_SYNC:
> -			val = test_reg_vals[encoding_to_range_idx(uc.args[2])];
> -			val = reset_mutable_bits(uc.args[2], val);
> +			expected_val = test_reg_vals[encoding_to_range_idx(uc.args[2])];
> +			expected_val = reset_mutable_bits(uc.args[2], expected_val);
>
> 			/* Make sure the written values are seen by guest */
> -			TEST_ASSERT_EQ(val, reset_mutable_bits(uc.args[2], uc.args[3]));
> +			reg_id = uc.args[2];
                         ^
Minor nit: this could be moved above and be used in 3 more places.

> +			guest_val = reset_mutable_bits(uc.args[2], uc.args[3]);
> +
> +			match = expected_val == guest_val;
> +			if (!match)
> +				ksft_print_msg("%lx != %lx\n",
> +					       expected_val, guest_val);
> +			ksft_test_result(match,
> +					 "%s value seen in guest\n",
> +					 get_reg_name(reg_id));
> 			break;
> 		case UCALL_DONE:
> 			done = true;


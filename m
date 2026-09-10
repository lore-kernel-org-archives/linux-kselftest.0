Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4188859C962
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 18:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066402; cv=pass; b=pP0K766fuv/Rbw6K3qFjjkcONVCRdZkt97j6ubiahSxgA9vR3YTvy4OQ8enThrNLWycwXMGsKxt7jQNl6TR4NE+JJ1iACfnV+EkRxcDRsMJvT+zrmZlWGu98qc/khMw5aoO5OP6x5ZGELTFikhL3+MPiZvMY4Mtv+C7/dS9zRJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066402; c=relaxed/simple;
	bh=dT4FNCiiMtIXPLJOvuFJF0jefoKwdOcRJ3SvzlEgqv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vDzqf15YEIlP26VGald07+6e0jqA/XPgbK/zDc763jBB1HTzrpbDa7ixs6oKb21Zx5zTxEpqhTkKtTxKnJiVClJV26HhR497xNbL7YEFF1EPjFJxqb0+qJgxMZaswU/k79Id3jhf0xYLjpsASlRyG6jB4uCY8mCamz+pWRqToO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sw2RHwaa; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sw2RHwaa"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so9586e87.0
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 11:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789066392; cv=none;
        d=google.com; s=arc-20260327;
        b=P/aEKG6FcRLmCyvJN1IQqm5DPTqMiJjD9Fj1a0b+QD5EXQZXCtnUInoGxq1cWcS/FO
         5zdrWvROuhpTOwfX0NycPmU4H7aD34c9wY8Sor6Y7r3L9Jt+CGtW6SnA5E/t+VHtAgp3
         /yBOSVFcClQESZOfuRamVCJX7wnee3BZkPGO94Acr8kSAgFfDLpyDRWQlM2aHGN+K6dQ
         sLsH8qU4TJjH7u1mKEYWUfIi5mSz+bnOgnvA1jPgM1a9m+YuOm0Bko57tZR0eB5BwODW
         n3+2iQneP3QSFXYw+XmqBzKiR5sGk86+wn3RxFM+DPDT3/3ksoCkrNqXbq+FVDiHG2a4
         U7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uPA7h1yzQiskXY53xtPOVbRZgGvwK1v/3hUYMrYw/Xg=;
        fh=Z/DB8PCx+pKgX1lA2cP/N7huXqqVLP0Zx5psGiOAGNY=;
        b=HAGd1GySwZXzwh8slrEgIEMoG4TCLKfiW2ckS7JO9OgUE7J1CjARNlvtbLo4jSDFTI
         oxsaKuHh13MDzrVszDt4l+ijhV7RM3CpQaC8dPPH8a5/s4cgKF5GDTGPXTPCQmc/BCWk
         We6M8qgcIfAsNrGJMwOWX2DXAfqSeBc6l4x3c63anPyllQu0po8nj5iiA26OQRweXIQT
         DhEjZdDhxLXkkhfT4cLacA7oyLAAAcLWiWcPUY5AMH3weMebPwdgJxCp0gNNfbC54SBW
         L/8lFPSiwsQ6FJnazdrKR/Q1BTyOEPoCkOO9eKdAkCxxB8Px4obqzHv2aWQaJIYpVeJq
         Wpkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789066392; x=1789671192; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPA7h1yzQiskXY53xtPOVbRZgGvwK1v/3hUYMrYw/Xg=;
        b=Sw2RHwaaXxf51aB+WhflsVPXZjPmG14dd4LokBPYZn/6ZK7idt0TuWHcwAav/rWQ/J
         eDL6t8jrNOzhMjtU1SidTyEOOIwal+t61/w4oylo6ShSyZHYn7vrPXaTTkeJ125mtlzp
         6dgwX6oRGqeQoen7xjJiFujW4kOEQWd5pX8BhfUxGS+fNbJQ7XnqkrnIWsCw0ykKcA1V
         Hru4wYgKWBHQ9f1dQi3R0+hFBxyDmOm4+9SCetyVRT2TG1svlCRnmbi7ps8RcMSy/x+b
         QMEzSPV81L3d30DWJPWPvUFoT7OY6HznQulPA05Ceuu5BvYhjvJPtKUhjtANy084mqoZ
         EVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066392; x=1789671192;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uPA7h1yzQiskXY53xtPOVbRZgGvwK1v/3hUYMrYw/Xg=;
        b=YUtOCoy8d5d1EFfocYme1jw8VgW2hj7gSjJb2r6g+wbmCMK9xHfGexm3oBDi945g4f
         3VbKne+SzcP2QIZLde4I2mZvUR5fkYbpYwxlI6qrJYAeBhOU7dc1jjhy3Pfgi1uQ6YMp
         j0kShIhQFqFtE9/tKcFNzAwDUrEMK+4fP8ZdlJKVQipbcDQk1uuatpTwoQ24OjM3hUAp
         z2IDp/Zl5jzuNnLmbIBT99XD35Q3VYMO7L1vfQMmW3LbmLoDjArfLojFZng+9Cw680Nu
         TSg7U6TVjoYyxbZ9PpcnEJSdwdt6ibazNLQbAw0pMhbuxuSs7CxdfJPq4nY1VXidMSyz
         +tmg==
X-Forwarded-Encrypted: i=1; AKwUvBwezQobM6YI0eQI30YnskfA5Hr2Jbg1mcdB2BwU0uL1knm5JweRNjhuYMB1prHBHYxvixUQ+1i1eKPeMfJW/1Y=@vger.kernel.org
X-Gm-Message-State: AFuF++ksGTiSInJ3ZMehxb5QsDLSpFis7vD+GNO75cFhC2BWsYFd/TH8
	MhCKaXiohUadGyacfZXsZxP4M4GXcLWN5E/ajoYJBzyykq9ADW4+3hWp6HeGmofvZbTx6J3Xl/A
	WvLfekDS3u7PLOVYrtLSzS+gGYcwRQxWMFPdH46s/
X-Gm-Gg: AYBFou1Zbkl68OiSfjtBLLpTDMXQ8hLEvOxetRevbBe0ADAd18Fo0e/RF5ZNEmBu9cB
	nyAqEFA3NhsEHTzqCbPrvOdzh169R4NTNkp2s/tAa33LySl6X0aj97/p8mvJW8vmp4ZzDyswXMl
	wT59lK6T3e+XIxUp9bIkmawcLZ1ZVEzapssOYRsUfYdeyypyiFkjTd5vWJq7doJcjXxvT3q3gvc
	jEVaiIn16Mk6MsMYJYgFKL3IPTqPvrGno7l5qivnBQ2FVOSHw890ziDDCaLTXJJ8btSvDOLRvde
	BAQCbK2/QrRHL+94vNyGlVVv3wLEtJYtc6QftYNvP7hIcwGuKk1UHgGPSRnK8X2hntjndCQjDTX
	wgSbeOTwOm0rvNw==
X-Received: by 2002:a05:6512:4009:b0:5b1:4fd9:ac with SMTP id
 2adb3069b0e04-5b8a07a0e5fmr23463e87.3.1789066391400; Thu, 10 Sep 2026
 11:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org> <20260825-kvm-arm-prefault-v1-6-befe8947702e@kernel.org>
In-Reply-To: <20260825-kvm-arm-prefault-v1-6-befe8947702e@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 10 Sep 2026 19:52:35 +0100
X-Gm-Features: AcwNN1XPPeWtd-a0jzst6s0fMnTr0aHfMbhg6rA4kjyMckfbadgDOVe553duj-k
Message-ID: <CA+EHjTzOKHNrf=0n2c_E+vbt=pGquz6qzBpJ+eLJ5hjK_nyJMA@mail.gmail.com>
Subject: Re: [PATCH 6/8] KVM: selftests: Enable pre_fault_memory_test for arm64
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 17:01, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> From: Jack Thomson <jackabt@amazon.com>
>
> Enable the pre_fault_memory_test to run on arm64 by making it work with
> different guest page sizes and testing multiple guest configurations.
>
> Update the test_assert to compare against the UCALL_EXIT_REASON, for
> portability, as arm64 exits with KVM_EXIT_MMIO while x86 uses
> KVM_EXIT_IO.

The message says this updates the test_assert for portability, but the
parent has no exit-reason assert and no struct kvm_run; this patch
adds both, so there was no hardcoded KVM_EXIT_IO to make portable.

...

>  int main(int argc, char *argv[])
>  {
...
> +
>         TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
>
>         test_pre_fault_memory(0, false);

Would it be worth adding an arm64 case for gmem_abort()'s pre-fault path?

Cheers,
/fuad

>
> --
> 2.55.0
>

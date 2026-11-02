Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632167;
	b=5JOYrbwJJcvSw2U8o0pIKBIEp7UrK7J+/r65Ryne2B7uRseWaFgHq/BAuYRfCm2tjq4I
	 Ytu0saJoRiz6wu22Pwj8eZWCVbl2bgF4FvY7f2wjZ5Pm1rN+iejvju6i/2mjReqNsJEJA
	 7iVBUGp79dWuTbadGWA9Su1cJdeRc1rlUe7pdj/w3tsWYv7pYwhePS1+K5g8Fm2j7cYun
	 BpHT4AkRWQCEZQhOkRwqLdiG/iCsENcj06cDg+WQQ2AO2PxmjqHS4ErR0CwjWzrl5T6Ma
	 jU+JXXfABkqVuKO0N96fhCz2G5BRnihjINEXostNsLDgmHdE/4ycuhBEK2va8oqvPvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=o4IgxgpOO75bp0sEBS0oXx8YKo2RRQODNqfIXlf0zNM=;
	b=g7IOLNK603htoVnwrBuzQbi4XL98akU+hamNThitfCJrzYqHnPiaUPQTazA94SjfHSwA
	 mP0rSj3284GBKL+A5lV7nnHdK7MlCBuxpavb4iBBUqAxFVUiiz3T8+SWwchHhxm1nq13u
	 Eme0370SxiyFiuwRLWULelVLWr2+FsyKFN9Q0VZZVLKB3/C9KZpjwejYl7GnpwCJ7i91t
	 eD/ECi6qx5z7SO7mqsMsJSESCuHaJ+2dqRuLMGv73mIs1jvjuRjwrlSsl4y8sL2vwH8Y8
	 LOEoyQpIbNtAvN3Be8j1WkdkvyCPcn1zkprQYR6o5P8Z/W9gxhwR19ohpopZGNVlPcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G1VbHq7o;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928F4606B902
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 15:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 928F4606B902
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G1VbHq7o
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so3231544a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 07:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793632166; x=1794236966; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4IgxgpOO75bp0sEBS0oXx8YKo2RRQODNqfIXlf0zNM=;
        b=G1VbHq7onzFVI6iV/KeCFXFFlbyvkiA9SY36CdPNhjdYsXmPoObJ+5LxmnTp4hgxMY
         1egvPRwlAtbp0AaJRJm3vDmTV5XfmZYol5ccc41eIXolKOcxY3sXrAukXUWRHfxt8qbw
         WhqrERk1nhrNwXAHLCdyeEhq4Bur9TqnZbLlHueqb7T6c/Q7EWSAskY5OajDQKmVaJ4X
         L6SemLcogIWnhDK+i3lu3lLUJztWu8l2Hn8kCspLVRHLBvQvMipAZL5WQz1pR3rUFt5c
         Th5QoQLcVzdByR8A2aDtl2XsNn/SQjhdze3wIXTSI9fk2fqTwyaNqNP3JAcb++fOF67T
         uL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632166; x=1794236966;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4IgxgpOO75bp0sEBS0oXx8YKo2RRQODNqfIXlf0zNM=;
        b=R9uwk8tEwqWKZWVpqcZkrVEKmFfZHdllqkT4+0p/df0u/aFaKz82t/DZR9pqcBI1t7
         eowCHLN6Dv2U9+QuIa+wqt1RwQ+LA2KNyVQHOq4Esbc6lUHRjk4CEx+kaI6TS/0h2bh7
         Ix6T/hN+YEj/NIkoriReMuHncmaataLxQBDf2iBapnRx10TWxR64SoPRrfi1D0tVvVbq
         lLpxKP4BgXE5nJoa1JdlwG41WHORVtncgRT+u2U/UvEPfHeSaFfoZPNFbH65IGWlYsGp
         tomPRXzCYGpbYwALlEWMhBVn5OLMuJmVH70WMUYqLcBG3luE1+sx66z849bDFDs5hDad
         BaNQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0bUoc/9H5OTyN54CJD7dUSNGFO7JhQYq7+fxaOR0iwlMe1w1FsjIQ+xmBx7jnWJTSIBp06ZYlCDOdc89H4K8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkEiKmVdsz1hI0DO0EoSgB5bAijBi24zlnlhTkmlXpREGgppv1
	qgPoUxQ5mw80yzUDv/ibm1/TGUiJmVBxGNnpf+gO1P29nsETr5lcJ5j92rrNon82oRLkbTnLUv1
	AvWl24A==
X-Received: from pgve15.prod.google.com ([2002:a65:648f:0:b0:cc7:caf5:50f3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7747:b0:3e2:8513:a1a
 with SMTP id adf61e73a8af0-3e928c5dcbfmr7462789637.15.1793632165658; Mon, 02
 Nov 2026 07:09:25 -0800 (PST)
Date: Mon, 2 Nov 2026 07:09:24 -0800
In-Reply-To: <20261029221710.1871112-4-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029221710.1871112-1-dmatlack@google.com> <20261029221710.1871112-4-dmatlack@google.com>
Message-ID: <auinpIEk6FdGwDS8@google.com>
Subject: Re: [PATCH 3/3] KVM: selftests: Use VFIO selftests library to pick
 IOMMU mode in IRQ test
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Alex Williamson <alex@shazbot.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 29, 2026, David Matlack wrote:
> Use the VFIO selftests library to pick the IOMMU mode in the IRQ test and
> drop probe_iommu_type(). Pass NULL to iommu_init() when the user does not
> specify a mode with -t, and skip the test if the requested mode (or, if
> NULL, any mode) is not available.
> 
> The VFIO selftests library now automatically picks the IOMMU mode that is
> most likely to work on the current system, so there is no need for each
> test to probe for a mode itself.
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Link: https://lore.kernel.org/kvm/aiIG2L_KdPwuxYA1@google.com/
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  tools/testing/selftests/kvm/irq_test.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
> index 791e576c334c..f9c11d80a306 100644
> --- a/tools/testing/selftests/kvm/irq_test.c
> +++ b/tools/testing/selftests/kvm/irq_test.c
> @@ -148,22 +148,6 @@ static void kvm_set_empty_gsi_routing(struct kvm_vm *vm)
>  	vm_ioctl(vm, KVM_SET_GSI_ROUTING, &routing);
>  }
>  
> -static const char *probe_iommu_type(void)
> -{
> -	int io_fd;
> -
> -	io_fd = open("/dev/iommu", O_RDONLY);
> -	if (io_fd >= 0) {
> -		close(io_fd);
> -		return MODE_IOMMUFD;
> -	}
> -
> -	io_fd = __open_path_or_exit("/dev/vfio/vfio", O_RDONLY,
> -				    "Is VFIO (or IOMMUFD) loaded and enabled?");
> -	close(io_fd);
> -	return MODE_VFIO_TYPE1_IOMMU;
> -}
> -
>  static void help(const char *name)
>  {
>  	printf("Usage: %s [-a] [-d <segment:bus:device.function>] [-e] [-h] [-i nr_irqs] [-m] [-n] [-t iommu_type] [-v nr_vcpus] [-x]\n", name);
> @@ -266,8 +250,7 @@ int main(int argc, char **argv)
>  	}
>  
>  	if (device_bdf) {
> -		if (!iommu_type)
> -			iommu_type = probe_iommu_type();
> +		TEST_REQUIRE(iommu_mode_is_available(iommu_type));

This is very unhelpful when neither IOMMUFD nor VFIO is available, especially
why the user doesn't explicitly provide the desired mode:

  # ./irq_test -d 0000:6f:01.0 -i 10000
  Random seed: 0x79d386bd
  1..0 # SKIP - Requirement not met: iommu_mode_is_available(iommu_type)

I helped write the test and I had to go read the code to figure out what iommu_type
would be, and then read the VFIO library to see how it reacted to a NULL pointer.

How about something like this as fixup:

diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
index f9c11d80a306..63205afc04d1 100644
--- a/tools/testing/selftests/kvm/irq_test.c
+++ b/tools/testing/selftests/kvm/irq_test.c
@@ -250,7 +250,9 @@ int main(int argc, char **argv)
 	}
 
 	if (device_bdf) {
-		TEST_REQUIRE(iommu_mode_is_available(iommu_type));
+		__TEST_REQUIRE(iommu_mode_is_available(iommu_type),
+			       "IOMMU mode(s) '%s' not available",
+			       iommu_type ? iommu_type : "IOMMU and/or VFIO");
 		iommu = iommu_init(iommu_type);
 		device = vfio_pci_device_init(device_bdf, iommu);
 		msix = vfio_setup_msi(device);

to yield:

  # ./irq_test -d 0000:6f:01.0 -i 10000 -t vfio_type1_iommu
  Random seed: 0x14e21328
  1..0 # SKIP - IOMMU mode(s) 'vfio_type1_iommu' not available
  # ./irq_test -d 0000:6f:01.0 -i 10000
  Random seed: 0x160225ae
  1..0 # SKIP - IOMMU mode(s) 'IOMMU and/or VFIO' not available

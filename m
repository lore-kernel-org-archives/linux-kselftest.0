Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8784369D67
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 17:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472186; cv=pass; b=ONKrZJBQ7tUxJLKOCL+PxBDbx56oTPKeLbUX0/swlQZLq2dtv7bpOMBuV1oe02nrIXCF7V01s5Kv8TICcwZxqwfqqyWHqnOL/vvg2dCGU/IKefYgd2RF8CtEM0dL4YP5919Gf92Iph1Nutpaq2+aGD0p3Pl+H0AnCZqqkqaI+Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472186; c=relaxed/simple;
	bh=9GcYQllOiOXdCXYyDijNgD+Nq8QRy6N8WRrmbHFTS6g=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ay3FBs/vGWAk+e2/Ehv1FaMQ9iHn+wxvZ4e4sKqE/U8kKNcQQrp4gYCeGaTzppW4se9knkbjFBR8nZFJ+lRHqq9Z/U342prd/FaGkyYq3n5vQioIcW/Z+ykuq7j+SZvXczo/uY7wX2nA4bZcCwnnz8ml0v0j3CxBp3QB4JIFT0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EDwb0hbz; arc=pass smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EDwb0hbz"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-956995b5bb6so2350056241.3
        for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 10:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779472182; cv=none;
        d=google.com; s=arc-20240605;
        b=IK0sMzY2ZxQYEZ/haQjN/r6ir65Gi6KrMywa/CYOzf3U2Ecjx9FUnSSaTtbMGqgn2Y
         vMCwnQu9Mtryil+mhbUrH4Ucc4UTvZWU/dBrLNf9ls9PGWo+mVyNvJtc6UtbOzT9yXfF
         Y8LIw/Da3qAnw3k3nt8uywIJ3qNPVdlhp4CoxZccox0iGXzfC8175t6No41mmIlcheEU
         AYp4FuZzX71CG36PPiZ5FODa4vUK3bqSt6TCCVzCUHKHCnLrLk3IjZyCNnqUd5k4VNMX
         1OVZj7a6DWdqx+AoFPEzvDXZN69owKknu9fLsyPetTNgrZ4BSyFXjdm9V9knf8fkqkKC
         r6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=FVdH+GINBIrgjBx6PgyXtUorNJPxdnp5KA8JCKORs1o=;
        fh=ZmwuxnZTAtb38qu37MC5t7AkTHlGfNxqdOZqvwzFxLs=;
        b=G0PPPu8w/qJs6I8DKf5UadKZKifVYEqEM69cw2VaDOtHxBu87VF0HradOZfJqwcGO0
         sJGa60Ppz5laSEi4ccF0mp3+ttgltKiTUDVhgIRIYkwLV+aFi18SaJOcfACd7ygUPJGv
         1snOZGO+z4x5FBt5T3sv0sFtbJjUDGrQORs8jp5vp2waZ46rE1np3XCDVv6SSYrCjlr0
         4vJyTImGqhay1FFbJQ2+dgvfZC9Hx8yNeQUqQ1JMb5pEEFgNj6WauvAh9LUgs6tCYVRT
         OlozqVnlkFNdnziGBTCTMMucFrVAt63VZ/wVzkUE/lRuCvDh+PtiabyvPb4EqtA3g4H4
         8SYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779472182; x=1780076982; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FVdH+GINBIrgjBx6PgyXtUorNJPxdnp5KA8JCKORs1o=;
        b=EDwb0hbz5ojN9+wvr3Kw1OIzXGyguQqEg6KQaHde5S1fmnPS9iO1SBwotxPgSD5ZQ+
         rXfJ5QVddocKEf+1zObHdJZ+VBgcr6ZhTVyGn+nnKBV7sB3AAxRi0BfY3npY5r1nTiEi
         2wwPP2UjDcppVIDcxqraRg481En1C++vm2KCOf7Z3LedeImOUyjRhCtSP8DsjtkgySzH
         DXF4HGJkwtgUfUbfVbjWiCX2iJbbdTdf6uYAJelYhTcB2dvsAivJk7n3WjE9lB29WCb5
         8GwV3/fPKphvbXQgbv9vv22Z9NBJJUFPKPoTjLWc0E1uIB9g5k+m8gEVmNv6ZkUam38g
         rnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779472182; x=1780076982;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVdH+GINBIrgjBx6PgyXtUorNJPxdnp5KA8JCKORs1o=;
        b=Z7iHiw7V7cLgCZpA1PeyYXq2cyhPDgZn9cjbKjknAD9b0mwGtTylAVRbojcJs2V5tY
         d6qOVfkpFgVzPhZ0S8vZXOml6PZOQjS+dXuPpBLc4KlvghKV6bDf+0y5h/NJ0QJENLFo
         7G7p66wC1EwR0mOfKEaPmuI6OdfwIhLedxh8LqjlgN7+kz9X9GzKoncsVOtneDLcmnXn
         1Ww2SYqF0ciDU9FX+MblRDH6IcMixGak312zGNJZb6j5Z6dLRMjsprfWU1LBxX73LNyd
         Ri6vAXiYgXRSa8QgLebnpaH8V6URdeXWlAVFMk2v/WhUCMeCPrFs8eH1S4rWQHD53TJn
         68AQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ywprGPQyqnIgGLiEn/HEw3OmB//xBLwLOlt0e1X7bd8UO689huw/VSh9kokVYUUncCKZPXqh855tf/ag6xxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXjDm8D2L0ufg01MsDnUaTjEHe9yacOMPGizB769PpDt5//ICi
	cb8s4bVc4kIRhTWgPHKmE3sj0o5uQxKiyy3kYmIidRLjN1jco4Q1dtnfXgEkK3Xd18bpyaVCPd0
	dFqSXwU74f3aJkVC7/IcngNqH5ckL6leqXEcoPlY9
X-Gm-Gg: Acq92OGWlsX2HRRy04pr7/xQQoZf/C1JInlfKM2+F0SzRBqGX/tLKkhmpns24DvFasz
	Sdqd9PYkGlKQmJ5eAb0b7v5A+ELxFIBkE3Na5nUws1dEKVrNJlq/9/liW7P6FeLbJ7J0aCq0w8L
	w/TSwK2SKil++xF32jkOju5J85/Kgu+4FQ9jN2IdvY/a6xoVlSDeJviFMGUiOAdfduyvK2ecd4M
	e/tSegTLfLYWFgkSrWxWoYkMlEnPqXjdFIDMw7erUhEF+k8guqm5VhfSAwWxYaBZ7CDYEODa0dO
	mpyvmF7jpJ2HcqcwQis2xov1mdqko8NLFKlNPyg9xXudShChH4x2LG47NIlUFLTz+N8V/uDyFHU
	0SF6lyTC8oFKfo0c=
X-Received: by 2002:a05:6102:304d:b0:639:4bb7:c922 with SMTP id
 ada2fe7eead31-67c8a075a9bmr2660069137.15.1779472181171; Fri, 22 May 2026
 10:49:41 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 10:49:40 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 May 2026 10:49:40 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260522171535.3525890-2-seanjc@google.com>
References: <20260522171535.3525890-1-seanjc@google.com> <20260522171535.3525890-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 22 May 2026 10:49:40 -0700
X-Gm-Features: AVHnY4LuZYRAS0FDuOxAwzv68OZS0CdPGN-j3m1-yuSIDvGSzm6OlLlXqCbSqho
Message-ID: <CAEvNRgH6Hud+T0OWO3EfDXSjE2H8j=KiJ9sUCHtbzf3fW7jtkw@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: selftests: Cast guest_memfd fd to a signed int
 when checking for >= 0
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bibo Mao <maobibo@loongson.cn>, 
	Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> When conditionally closing a memory region's guest_memfd file descriptor,
> cast the field to a signed it so that negative values are correctly
> detected.  Because selftests reuse "struct kvm_userspace_memory_region2"
> instead of providing custom storage, they pick up the kernel uAPI's __u32
> definition of the file descriptor, not the more common "int" definition,
> e.g. that's used for userspace_mem_region.fd.
>

I wonder if the better way to handle this would be to have a clearer
userspace_mem_region vs memslot separation, where only the final
function actually making the SET_MEMORY_ATTRIBUTES ioctl builds the
struct and passes it to the ioctl. userspace_mem_region should store
userspace-facing or userspace-specific parameters.

Anyway this is the faster fix :)

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> Fixes: bb2968ad6c33 ("KVM: selftests: Add support for creating private memslots")
> Reported-by: Bibo Mao <maobibo@loongson.cn>
> Closes: https://lore.kernel.org/all/20260508015013.4108345-1-maobibo@loongson.cn
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index e08967ef7b7b..4ad015c6c44f 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -817,7 +817,7 @@ static void __vm_mem_region_delete(struct kvm_vm *vm,
>  		kvm_munmap(region->mmap_alias, region->mmap_size);
>  		close(region->fd);
>  	}
> -	if (region->region.guest_memfd >= 0)
> +	if ((int)region->region.guest_memfd >= 0)
>  		close(region->region.guest_memfd);
>
>  	free(region);
> --
> 2.54.0.794.g4f17f83d09-goog

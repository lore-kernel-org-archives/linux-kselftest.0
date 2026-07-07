Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BBF230BD9
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Jul 2026 01:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387941; cv=pass; b=fcQkUOxLle/X3wvUrSqdJ8+U23uelen8ozWsgJlCHSZrr72UM+/R7jeclsHXBbkanqvJxog3IA6m7lXQn+0coFp4AZ3f1UbFnerM7XvVV7D0UMdf7eVN568lbVeR8PQoUjHSW4kFsnzr7GW2QhupJaH1RIueAg1cw8ka9cG637A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387941; c=relaxed/simple;
	bh=uQqDOtvVYIonrHAJ01jdgHIjaXEF7Vcr3bCyQxuhti8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KtaH5iBMfwbuR1TgGAdCxlpVEzzsp3aI+4fC8G8WDijRIkilA3lc2lhQzDGw/Z4MLL57Olaeh8lX9719cO4iMm8cbzlJmnPSSOmeiQFetesb3XifqzHMw45lYboM07mVrgXY8iYJtjjsy7q9TD//wtOHtg6oXPD1PiHCxMA4nDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o0rUw4Tw; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o0rUw4Tw"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-698b78c05b0so1044a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Jul 2026 18:32:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783387938; cv=none;
        d=google.com; s=arc-20260327;
        b=VUE6IE+6NSIjYC2nxN7ISBYDtS0PbYyIwdOyaaPdI2csJkRuJbU2ei3vTLTHIAVwNh
         QlGSTZoCmohcFg90uvO+AitpdbwzIhc+sosOP3GvW3ZNQqF/ZmGLqX+AJV3pAK7em29n
         RLKiMN+wO3qxPQzrK4Z6IMaHBdYnhHZEolipGVOhyvVbnxFaAmFJynMkcb8caj66nhSo
         4uWh7A9k5MVEOF2TWAP/Je2YaeaLeDPxCD+WczP+e0s/1ew2QqWNogJL2sco8QP7r/fs
         1wcX6RBIZjUqz1OZ+0R9kBhhkocGPNkS5RErjOK24I7NlKp0SSOS1Fa9kasyl5YA1igu
         MJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uQqDOtvVYIonrHAJ01jdgHIjaXEF7Vcr3bCyQxuhti8=;
        fh=W9+u8CA/VEHLT9pb2WEw96rOVZze8l5t++Qu/zmXUn4=;
        b=kFmAhVGnhUGUhxFpAUSOjSrOGKCutfxFSpsLTFI1BGw/suFiT9TjFVuzZZpTLN0WxD
         Q/CjgBKgjZce87cRIK1TOQi2xIjnX8elz0tvPYqvv8XBADLhKnQgUtOI3dDLloF8/mF+
         LMLAERemoH1KDvHcQiJUwKP+bj24N+GhoPYVZXiT9g+JvtungegjsXcoSoUQCnukZbs4
         cbG7YDC3txzDSN1ybgzZPoC/2Uj1T6lU0zbHQtz9FKdB8NIk8Kp6+sxItfsEvK/J8a3F
         1V5/6fL8W9OZGmC5xAFAa9cVi7+y96i/eFrFxZef2FKPHu8R1+rzBVND1ufxe2nzSpSP
         Lc9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783387938; x=1783992738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uQqDOtvVYIonrHAJ01jdgHIjaXEF7Vcr3bCyQxuhti8=;
        b=o0rUw4TwgTcpFHtaoFPkXtfhtJVMXun3usf1GG0d11yfN8yzVaJkYAhpAeU9vsqwgt
         /rJpyQVNIooANJ5VHgqPV8qxaOx0G6J9HqbZB8d8AxJ4Um45WfWHsvuk83tRItSyxmIz
         A/2XJWq7ruqFbahsO43Aa7wYOnNcKrnrwMIjDflfz/TevK2/msGkFlaZ0JjL3sQk4KMD
         I3lrSPnr5+mQ4xBKpdU5v5KOa7GWYhe1sYSZ6Axxs1XSHxXDGRUn8NnEa+H6Ff4XKFUQ
         b1w9ReASh0KgACwr4Ujm+dpT+YlFPqo+t7igN0sPqYsnBjEi6ZzNdscTPgLAMaEMkKmK
         NrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783387938; x=1783992738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQqDOtvVYIonrHAJ01jdgHIjaXEF7Vcr3bCyQxuhti8=;
        b=TRFLPhbvSRXvQSqrVUcSGLmdnJqZVtkhh2f60P4JLcGHAfDQpLRh0mHjQMqUPvsEBq
         2KtH2WewnukJdoqvo5RdRBfq2S0Ki04SZ0lGWSyfqAEVVn5KHpWyK21Vp80dm4jRLmkO
         7z1APl/dOTwZC7zuuZ1We77LO97aiIdagO/3x50TRDpYDRxb4KYfkjvgVzEx57WJY2Gh
         iJHAlBR5Z7j633LQh/ipxhY2NT1XfKsEWAE+OjXM0kIWTK5W4FaIVWJrJlID7b4/uZjC
         DSum9N4l7MBRSH1aL9Mixj+zwm+uKTOehYaOGXPU/phY1YxK/S6v6cXDGTB11Sm/Kqcc
         YW6A==
X-Forwarded-Encrypted: i=1; AHgh+Rq9qZ6RMFJ8M1lpMbs1fboLdtpozYZlwVO/RY8XwPpjkE6fpZkf84987tbVOE3I79TyJEDTqjhaRc/8E2Jx1g4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7JGMeq4+lXTFCtOBkNqP5LSFWMJGvJZu7/P3wOU6cH4NaUsj2
	JFOeM7YZXb50rvEMbAfnq+LU7O+UyUBCCDT9loObmhTrwrmKj5ftHLhPpGEq6Q6Xa251vGWpSLH
	Kgs1nKriANB5QbVQJVSSqmAltuNhhorw1fxdetPUaFPsO9sowOnO7rGEQ
X-Gm-Gg: AfdE7clb9xJxM+gB0n3Ukya1tYMqowgemEi7u0lxGYM97JQAy5/jHMXp3gQGlCdceY2
	cbKP0jwKjmzT20SuiC6MEdoq+6jpNBBsGOynCafZlzcCQeI7CUIWbRw7szDWM2Avxh4B9aJSTRn
	PDinbiH1rPXu3zLz/AH5ZVzgoCZLGMWBpQCdIjfDXaeCgpdXo4Zonxlx+a3OQQbpdO6GaKEn7Y8
	Q1Kt46DxNxyLcOa2X8W2dCX9td8yMPbkgkL/WW2u/GsQn9IFuCppGHTZ0dlh73i6UKm8RiT
X-Received: by 2002:aa7:d1cd:0:b0:672:117e:55d4 with SMTP id
 4fb4d7f45d1cf-69a9112774bmr11837a12.0.1783387938042; Mon, 06 Jul 2026
 18:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629125205.52394-1-zhang_wei@open-hieco.net>
 <CALMp9eSLH7pT7X22es+AotxhRMQ1VyziWWELQu6_ZRsyuQ=xzw@mail.gmail.com>
 <0e576fd8d8cd2ed1739cee36eba393fea7745506.camel@redhat.com> <f70b4a3b-1ac1-4269-ab7c-0ed1fb42c357@open-hieco.net>
In-Reply-To: <f70b4a3b-1ac1-4269-ab7c-0ed1fb42c357@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 6 Jul 2026 18:32:05 -0700
X-Gm-Features: AVVi8CeuEpjvE-boJQD0P9f7ZnKmLcJ-2nHsRb1kw5gzvJYtKgcEOVRhKUMk5Z0
Message-ID: <CALMp9eR5jVLGeQck89kro1ocEX5aZcovdGMK+fuzXjqK1NR7kQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] KVM: nSVM: Expose DecodeAssists to L1
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: mlevitsk@redhat.com, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	zhouyanjing@hygon.cn, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 5:02=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.net=
> wrote:

> I will take another look for the next version and try to handle the
> remaining pieces properly, while also making sure we don't expose stale
> or incorrectly synthesized decode-assist state for emulated exits.

Naples erratum 1096 seems to imply that the instruction bytes stored
in the VMCB are not necessarily the same instruction bytes that were
fetched and decoded to lead to the #PF/#NPF. Hence, in the case of
emulation, it might be sufficient to read the instruction bytes quite
late in nested_svm_vmexit(). That would certainly simplify the
plumbing.

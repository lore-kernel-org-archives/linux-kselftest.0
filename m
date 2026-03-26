Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BD978C9C
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 21:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774559940; cv=pass; b=M4EeU8C+tByLTSQwhnM/ezbc+C/SLEqU5XYcwuCh0GFUe+NDgIUOjf2ttUWRohU5OTCabU0cLsJOj4LMxVyGrRh5AdlG1X/iRuB7hjI7FEk1qnB3bwjdhfR3zuTIfDswXdlClvM6J9KJhohAR75/sYqshw5TZ5R1ycjKus9fhfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774559940; c=relaxed/simple;
	bh=LHXuVvweXDZuWeCrMV5tl7IRS4OHIF5ZwsqkAGrl3rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HlqYRiCkWrN9VCBB7SgxkojntQMwNqaLqV1X1fTUR6FovnWcXiZclzCpUt0hQ5/T0QUljjKvvpXvBticGy3UBgzA61TO5IpRWKaeSTP93HCQ4BWdZYbE9N9hqrPuW4h590GTihLGJA1h6cG/9w16MrMC9KKJ2jjoJcNFESJAxAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=llPpyUlU; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="llPpyUlU"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-661ce258878so3569a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 14:18:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774559937; cv=none;
        d=google.com; s=arc-20240605;
        b=PuIXqdqEo6zSy6KTBVSWmOoJ1+0eJaXYqHC/txX+Z5j0a2knOYsLui1fPYIOq1DxEY
         PlVFvp1wh5rj5mVzWSWEXltiAxwGgP25v/2OtWsxcPWOUc06TsDM1oy5lc28i263ADYD
         gK06kS+broUGSvMaSbBpKd8Qa3Tb4XtWSGPE+2n/9PekH1l+AGzm6J7Yc/kmMINdF2BE
         M/cM9vOPT5TjCoA86Nr1byqZ2mkj6QoGeqzWfm55sCVD12nwzDV6H9m9uH4sQ79KrFdk
         7EsPAbGN4cJwf64Aj6N2xNPVHF4DXaD1P6ZAdf6yVhTF9yJBN+OZXKEEzvybJbnR5EIs
         ZZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XlLfO1cb/56+ur6tHTeZ+IQnj7HVuNrwyloRMOxQArc=;
        fh=CFDsDWwwxVxBOljTHDmlreoWi3HVZHq+9jhFxyBpoPA=;
        b=XZYTxOQW6vE9D9mRxgLoJNkYzJzG0LLlLZdP3MPvb4/B8SuMPTd3VULNKHvhKRO64r
         FiboPLJDxQriY7BUmEu/MpHXQFEZfpdElZM4kwlFvuif/HOgLcWBcaLiqWEaP6oTCPKI
         4eB2zLWJbZqoBeIeeHh1HNZE+59FL0P6B8ngmbq6M23k9j68Y8KPSs42mnb2mMKK2Mlj
         0xwB6cOlGcjOia8TX7Ln7UU7Tx5nc8IKz1mQ6aFismpT3zVKsZSHSvrVwmmLwqyOJKRQ
         S2wiLlTRu9wv0ZgjcOTLcRSad4hf1ZMiw8ykLJnJgpHbixkEPbBuEBfe5QPhcWfToA5o
         yjrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774559937; x=1775164737; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlLfO1cb/56+ur6tHTeZ+IQnj7HVuNrwyloRMOxQArc=;
        b=llPpyUlUr0KStHgj7OEnr4yp5dllmuxGBCYCyqwSYnXBcQmFeX0JUD1SWRUArtVD6c
         y8FKnxOGMkIMBZ1ZKkFvCOJ0sSdHPoO9266DIgLFff8/4BmNQWloi2+mCfrp2OrnHNkb
         Ha64R3KUwv5fcnzJowesGQ4GBOG7GmM0NxvrEG4oOuH26EleySz8jcBSZQyXMJIVfVa1
         yDgg7P92XR0VJ0cvlDHocwTJicQTL/Mac+wUDJBh2i+/mlwj+VeySjvvEVaZsf6C4eN+
         updxwqNkDPxW2r2VZPdt+5T8Dk4yURTp0EWqI3mSr+GV4c6HjuaXt7Zo/7VtNrPN6o+O
         YzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774559937; x=1775164737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XlLfO1cb/56+ur6tHTeZ+IQnj7HVuNrwyloRMOxQArc=;
        b=iyxNAafkY0wIBx2I6OBBdGSYo6XuyR94IaY7LFpMVycP9n1MA3aGpA3YpjECcFo3D2
         1jIo92vn/sDuQ7BbHCrj9e8usQe5yNGnQPAXNCjRsckmzgPefSUh8isyNq9kneW/s0BS
         H5WIL+0m194pc6ktqSoCAIcX11R9K93HGxtbfFaTcHYqoemt7RJI/VAGgCBbYIkhF5fn
         Db0isPcm9PqQ9yQiPGGkIaN5kwINgdlcSY2sJigyPp33minSQq4oOjUB/Xt3N8Nf/K9Y
         5jmSTGw/PXm0LVfAta88DfYD/R2aK8cKK0jJTuli46RlfP3+WxU3JC5W8PfS8W9gN9+W
         Ud/g==
X-Forwarded-Encrypted: i=1; AJvYcCV2A4Qsw2FoXMcXtgo2BVk3hx31zMOSU8/wv3EfBsJMQE2uZ5KKbtKMwQ3S/r8VWGRY9W/9GKpZXGnqmHu2ZOk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb0lVhYBprfwG5SXIl9c8tJsirC9Byl3y+un2jVZYQQOp++Zl/
	kyQNzx+OAlqdrEwAUuQuK9kq5/u9OfOn/uRSirsBFvVcYuWdTzE4caY4GcBF53PqQqYFRaaK7uw
	kNe6drD+xxcS4/jRpjB/N7hjJa0qsjQSVI25QQ/xw
X-Gm-Gg: ATEYQzwehh9UTfZFShZwVX7gstC5C1FvFIqhNUYbB2P7VRmz1QsU3dFU1QiprR+AAfP
	TC5zl//fL9rxc4G40GKTnA6lV4l1eGH2mbfhE0JyhoCnPgvNVqQlJTZynoL/pX/aYp2Hyq3EIwJ
	iKZQ7jcjtALUya9sdj0P8CHwaNti3kj7pzDtbn9ZaJzMlLTcWL9vp5AvAJa/YWttwmsFJMg2oa5
	4CBmGQw+2J7lrVHQHYn+5rCz0wIAetr5lEyZY6dJOG4Wc5gF/jXFIllrePMajzYwUQnU6l5n2re
	GNWqwD0=
X-Received: by 2002:a05:6402:524e:b0:660:efc9:900a with SMTP id
 4fb4d7f45d1cf-66b19d7cdc5mr18822a12.10.1774559936890; Thu, 26 Mar 2026
 14:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212155905.3448571-1-jmattson@google.com> <20260212155905.3448571-5-jmattson@google.com>
 <gqj4y6awen5dfxy32lbskcxw6xdv4xiiouycyftjacndjinhvp@7p4dtgdh6tjw>
 <aY9BPKhzgxo4UuHB@google.com> <CALMp9eR4ayj_gwsDQVH8pQvzqgEYVB6ExWp3aFgJXRWikLEikw@mail.gmail.com>
 <aY-jViitsLQm9B83@google.com> <CALMp9eTnXW9=0=+RxQjeXfA++UP3MX0LzXo5qwUP-dCCQjOLVQ@mail.gmail.com>
 <aZT5eldlkLpRm7OD@google.com>
In-Reply-To: <aZT5eldlkLpRm7OD@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 26 Mar 2026 14:18:45 -0700
X-Gm-Features: AQROBzClx4xb_etceN2ElQB1z6O88taXT4sIAxaMd0Q0vu_Cb_3vGIogkatkpLE
Message-ID: <CALMp9eSMLwiE7JPs53w8Nyq2HB-Thmv3wNiRkMV1zrJmJeoZag@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] KVM: x86: nSVM: Redirect IA32_PAT accesses to
 either hPAT or gPAT
To: Sean Christopherson <seanjc@google.com>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 3:27=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:

> Side topic, either as a prep patch (to duplicate code) or as a follow-up =
patch
> (to move the PAT handling in x86.c to vmx.c), the "common" handling of PA=
T should
> be fully forked between VMX and SVM.  As of this patch, it's not just mis=
leading,
> it's actively dangerous since calling kvm_get_msr_common() for SVM would =
get the
> wrong value.

Though I included this change in v5 and v6, TIL that TDX calls
kvm_[gs]et_msr_common(MSR_IA32_CR_PAT), so the common handling is not
fully forked.

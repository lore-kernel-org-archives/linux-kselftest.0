Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A54A3E9F9E
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 22:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787005492; cv=none; b=VpAjChlNahIP6OByydVw71wpI892hms1c79CeXvb8zK3nDQcTB0oSq5Aij21t3lwnyB0mTg7sgG75fnZqyT9waJYXkQR66JpkOTkYYfAhPw29OBM0JHcyqsrXbCFmtSmURA3yU1bVf/ep4gu0+WgR3rigXbcGmpl09IpsaJ6f4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787005492; c=relaxed/simple;
	bh=d9LhXpnY6UtXvjqVCNv3ykiw7EdflqUxoMYWCThIQyg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BSLZ3dsn3vld99hTwrOTbwNJmwK9tqgCNbUgAyXoNa3kQaHB5ryA50qn28/VXwaJZPKd9OlrvD3hrgJvk+bYOKkDFIY27E3jbhQL/g8jEv9JI7FsEgX0hVVuCH5j7c6EBYu6tFWouF+jnAtCMXJzY2LjMGHZ8ogEZUchJg5UGFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PXGIEQm3; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PXGIEQm3"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so1212003a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 15:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787005491; x=1787610291; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCgiatqMkEQJ9JsWA1Fu0ZG6UKepMYZLO5k8sAdfDUI=;
        b=PXGIEQm3V+Ky4syIw8FD46X79anXF20ZMOC2vaYfmWV6kS0kyHTNOGOgNjWAD9mO9Q
         0GiqT/ZtP8cYiBX2DzgBXimNzmd3hBhSaGfiSpCpAHejYu/4nkAQV6x/OtTcqUL2hSEK
         i82xhgMbjjNBkxXefu66f15RZmTVLn6/D0TSFaHgJpR4K7dRsV7ml3PQ2Mr/olPdmw7y
         GXdl/b5orotT5gz9R2y9ypK0Umx4AB+jiIFZ+C2YSFObI3/f+R2sgE1HzGAWIKCTNOjR
         hNgekVa/xq5Sw3DjpJL8WE8i7Jno+Sg1MNf6WhsrgN8qqyPpI1YXP3KizM/XJXpw1RMM
         dIZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787005491; x=1787610291;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LCgiatqMkEQJ9JsWA1Fu0ZG6UKepMYZLO5k8sAdfDUI=;
        b=fBH61m9O0ixDaGG+AjdztGZhnpGGMM5lTxTqTOHqQJd8dMc8Ld842GCkM4OUHV6ezg
         zFfs1p+4m+CFRunx8esCmN4E6vKSwYVqLRLevAfSj5tSo4kmfXjsVX1KSVym5JyahiX4
         ZEo7kRwZEmdseysSYiuSQNrK4ZJ/gBMuR/USJDlPFBBGHkiSU41VZ80LKDcpDcQtXD3r
         h+11GA5nNb0SEZ9u4fTghouOkoUKfvGQ/3FF5izOpJow5WG+hd5H2wrXaNGCBlemcPQ5
         mehUfFrDhlfBAD604rBvtgBNLmdP2JsZrUAPLKl7b2dyb0hZaM+BpReLeHXv4BnQnSzr
         j7CA==
X-Forwarded-Encrypted: i=1; AHgh+RoONG3KG5wmapvTBosFsDM4yLRARsEx+B+y7Z9JXXFXhF3g6KTSha19wU5v1XJVJVZFWvpM7eVmCsA5Pr7LcJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXopkKf7FpzWBuq9mL6wQxPNv87OWrmUIGDYLpKNQWvgmyRq0r
	mCQ+YoPYyBywMOc4zEMy2dPcV0JkDTQfXWg0qQinc63Scy3Gan6D8H2EcbOpF3bHlVrhcesEREg
	M2PWokg==
X-Received: from pjbdw4.prod.google.com ([2002:a17:90b:944:b0:38d:ed16:8b30])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3843:b0:36d:9e0b:3801
 with SMTP id 98e67ed59e1d1-3955a5ee17cmr3105430a91.8.1787005490535; Mon, 17
 Aug 2026 15:24:50 -0700 (PDT)
Date: Mon, 17 Aug 2026 15:24:49 -0700
In-Reply-To: <20260817220457.554823-3-hisamshar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260803170825.925561-4-hisamshar@gmail.com> <20260817220457.554823-3-hisamshar@gmail.com>
Message-ID: <aoOKMeua-cNeTxXT@google.com>
Subject: Re: [PATCH v2] KVM: selftests: Replace ulong with unsigned long
From: Sean Christopherson <seanjc@google.com>
To: Hisam Mehboob <hisamshar@gmail.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 18, 2026, Hisam Mehboob wrote:
> Gentle ping on this patch; it has been on the list since Aug 3 without
> any comments.

Patience, please.  This is on my list of things to grab for 7.4.  You posted right
at the end of a cycle, shortly before the merge window, and the code in question
has existed for years, i.e. it didn't seem urgent enough to squeeze into 7.3.

If this is the very last thing needed to unblock musl builds of KVM selftests,
than that changes things, but IIRC there are other "fix selftests builds with musl"
patches floating around.

> The musl build failure it fixes is still present in current trees, and
> the v1 feedback was addressed in this version. Could it be queued in
> kvm-next?
> 
> Thanks,
> Hisam

Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5650A38424F
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 18:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199343; cv=pass; b=hOzwoLNAiDlBDaYhFYmB2ETAwr0VCrUcTAuICbVYNuMPrF5SWPVqbhCUgxJNI3LRQUf0Uqzyetq7/5T+bbq0oiAF+FrHPDcBo6R7o4YepmXIWRvyb/AtOFQRxNazE/JlReiIDHfzTogCAY0P9Pw9qIxCoXcaJiX3wNKmEDWjc0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199343; c=relaxed/simple;
	bh=75Peh7ssm8phsUJD3ZkLZHFwYmM3QKn/tUwpbiHhidg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xnt0J+llqkVqhZenPs5GezZn3Rc97SweoGIcURumvoT9oF6F44kNe4nkGGQDV+53kSKsQ9EIKxzTh33naghfXXwpwj2NHviRJhQAWXuInLKPEeU6PvlQ5DuF1ofIksBVFKgmTfVwO6+F5kzfsYWdlITGesvuI5XNwsyAcejaAWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XvmSV75I; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XvmSV75I"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so1109a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 11:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788199340; cv=none;
        d=google.com; s=arc-20260327;
        b=MtFDj8mj5BSf5cR7ucLqstoSImy/Q3Bvaj4kB13IocLXWxgs1aiXni2vx9yKk2KZC7
         gTTLvFsmlGOnpWyK9FWD57svNDaFYYUi15IyaFkGFZHsU/C/PNlM1o5hwN/8dDLI0yUz
         4PythiYYvmEbWXQMIpKdIJMNGcIUMcK3mGuWyJQIXpBMyHtsS6SO2RIZUF0oiqgun4wQ
         i/STN+OmJVI0dypRwgJpxxzYb16B0Imcd7a8zBwdS+U4mGusOXC1idvyRBMoL4Mpbi9i
         ZpUV065xT9GfXWLvtZ4pC0b4DuqKby8L0eXulRrhHciMqO7+jjq7n15hWQO1Hy4zYBP9
         mlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=75Peh7ssm8phsUJD3ZkLZHFwYmM3QKn/tUwpbiHhidg=;
        fh=Dbfp2LeuLizA97RF4ZX4gIrpnEVPnSFK5wJjs671EEo=;
        b=Fz5az0R3285HzLVGlZmBHR90fn82P9ZKl0WzOoB/XiExvsbgrBuiAvayUdCdFClVCx
         7OLNRat8N50HRpmIp2BeSCWwjhyubJqMxjC3186ldlpDuFpSbyslP9dZvkBAoPd82ZP0
         vU2b9l+UCO8/4bN3Jpf0NSHBZF5kH9ZMd7Zrdq+WwU6kWi82934oQy+9wG5xF51a/TqY
         hH5FGKnJvGqK/wEtwuOecHRvX5prYWIom6jdgwKoK/8MqtPfSj2f0FMQdyYxjalPer6B
         5jvyrfYolbRozNaI5Mwty1AZJ2/lFwmKUViBaUyvCwHzkphRhmGougbu4406WhAE4caM
         0KLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788199340; x=1788804140; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75Peh7ssm8phsUJD3ZkLZHFwYmM3QKn/tUwpbiHhidg=;
        b=XvmSV75IGw/P5cvyNGDtsONwapenqLlDkfpkWchR8ps9lLd2rQ40bXF++IPwMNMq0O
         r1UExgWmn0seAhP/OozrlUh9194yb2hATqXzcJx9b0z4YjLxMszTH1eV7B63VxcTi4jk
         yJqnt4gbltW6mmNcBoqVsEI5pNicWU0YKrI+jPH8a/u1ZUrTMP4Hzum8yOy02iALDFZ/
         OVKa6WwR7TGtOMczxIGO5aM2YldvZE9uNUkPyAg7SGy/gp2doLvRFX5KqrspNusbhECh
         OwsS0hYSx7LSffb1INnsZjpNKsuEwx+yxs/9t6pxQzMqhQCx6XBINrnST/lhmhXziaz7
         0Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199340; x=1788804140;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75Peh7ssm8phsUJD3ZkLZHFwYmM3QKn/tUwpbiHhidg=;
        b=V2ciFawC1ygrjgmqrEJWmrHZKZSWPcLKyZD8KKnfml98m+9Y6zntCSGXhiWJ3/vhxT
         62cYVze+mOXyBwdya5aent0jzSus4IIMtbHpqlXGROVaU4DXzcCZkq2KAG7zjhJDFN3i
         M+QpWnws02FdUX+80QNP5rqZNvszorngBd5cyRcdHR/WFytvalzIyH9WhUYmjhI7iWtN
         Uuqheu53tT+8h3Tvbo6fsKidffI1QXThSoij/XWRaZXSQuT9FIyZetDSWNE/gW63caH1
         2qAKHXzjn7wnOC/X045LKrnMONTmLq0KtI6FZ4AACzXjiHoRVLk1vf+OzqGBeZYAYhpE
         AUMA==
X-Forwarded-Encrypted: i=1; AKwUvBwSn/U2tiiO+DzB9+dRms76ZF04/Rm6dzJDLyimAZr9RYHuS91SUmsL95d2ZxduBCI3sEvuXXI5Z0JwufPs5UU=@vger.kernel.org
X-Gm-Message-State: AFuF++lsLj0LBjMv2H9zwiw2vKJEYMyyhO+6yVUkP+GRzHAhqNxI3uhL
	MewQjZYw6sS94LPgtq3dXJq6Mnql4deHgUJenp9NiZX5iSyhUwUsr24r5XtttvxYP0y6HAFtrW6
	2iRThZdoLceHFx6hJ9C0oC8CdrL/jIZPDSFRbKfpT
X-Gm-Gg: AYBFou1ZHnJyWHMV9q30P7i8PHnE9wnP30dseVfIenJTqpcFhhBvc+nicECjG3dKx/l
	mSvhTmkGMseHZ5XplS+ef4iSK0eeLkqAR1L6+uEYvLRwaatk8ktnw8quP5AiZlEbx1rnOERYW+7
	ZntpPe0moQl+QpCBsLhYhTObU0xS5e/4KBjxamCnMt5LVB1AW8ri3agphLgxyri08tT1xuN1eDH
	oQH61kd6BzvGRkE9obdnQI83UpqKNsTlILfOem9g6jI16py8FLOsmlEkEpQbmD5yxKMIwdQ9Dfz
	ukFMCwmNFro4G7ktUId/6mtloSnWc2t+RoE79sBO3zymO7PE25iYTYiJE6awq4INcRPcCOeeZp4
	qaw==
X-Received: by 2002:a05:6402:22d1:b0:6a3:ec9b:9dfe with SMTP id
 4fb4d7f45d1cf-6a66a17d251mr2710a12.8.1788199340005; Mon, 31 Aug 2026 11:02:20
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828215252.4126811-1-eperot@google.com> <ceef3a1e4e86deef2970e80d94925bac@kernel.org>
In-Reply-To: <ceef3a1e4e86deef2970e80d94925bac@kernel.org>
From: Etienne Perot <eperot@google.com>
Date: Mon, 31 Aug 2026 11:01:40 -0700
X-Gm-Features: AcwNN1UnnEGdSnQdQ17OP7lths-5KZ15H5ByB4zkfrtDMak_OBA1OLjNz_lVuJA
Message-ID: <CAFKBtDL9jBTy8BQL8poUCqckwmSRDByCQMfLyo3SMV3wnpaN3Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] cgroup: fix spurious SIGKILL of CLONE_INTO_CGROUP children
To: Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Christian Brauner <brauner@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks Tejun, and thanks Shakeel for the review.

- Etienne

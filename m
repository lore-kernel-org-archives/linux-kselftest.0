Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECB03AFD1D
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789414843; cv=pass; b=CM9EA/gUQglmW3mQpekxjB25NcgYmgsDKXyU2YVTyzc7iptHIOlPbWJ6sxr0Zbqmnc6OqxufAfomJIpag0KfVZahpqnyUmwR2TtWEdjUIlykCV/tElMebul26F6zxZ4RsBh4VS+bROJifQ/BFBYTmnbJBzaR9uKMO3VhtyHWG74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789414843; c=relaxed/simple;
	bh=IOrLEilFHhnJxPSxRVHThux+VKNAZpXoN8B5i5lUFcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AYOQqsHDVMToRMeTZPl6ig586gTpwVg6MYcNaJtup3brdwvHrK3jw1IzI4pL4ELROEMzGJytH1v2O86XzWuvSE0bNGizXxmdGbwQd8s+GGeDeOefHqiFMuBbuE3f/EmMYCUwlyZoJYGJIFqyCWVryhyAmMkum3P6Rse0i0mnKs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J1GTsN2k; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J1GTsN2k"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9a26ce21aso17216a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 12:40:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789414838; cv=none;
        d=google.com; s=arc-20260327;
        b=AQ3nZTQ6/cqAuzheJjXHs0re6ppTlPibXTYIKNoYqWrag1x5LDys26gYyLLLmoyu05
         nYvvmWiFAUW41uITZCSo07eg1ZKnlh4eXYzO3bOJ40WsSaCHXOXSS6R9wH7RjRKlufPK
         f1AS7Lx9IB1uTem9gdUHCI92n1kHEkUEZwcyuT/hzekTQAASe11JG+NmrI9Hxbg8PhYL
         axhn4APwR22Sezr3jj6JJPuF51QzZw9vf/UmESSZNnTuw/bkiKeT06GeYG4ZwUdV+0t8
         HI/Bc/nbeqLswsbmXe8hjDS9JvDKAMV+HUELzWiIlg0fbxRL5AoROrb5Wh06MW/d2wr0
         +WpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eZUBkwIq/fO/gxt56/XDzAsEFFKgZRRoosZ19gkheFQ=;
        fh=OKGXh6LXyxKvVBuTmHTqfVUeXbnYnfq6KHVc+2EXa/8=;
        b=FL/yAf4D3Jy1N7jXFe1bjpa1wlaM2W2Z/jux3R04kLvlE5u7CxEgXR/VzbjLNw9LdQ
         /vM0zKNPgu+1I+9Ajy45v5+yFbZBrLwReKPHRdBumVSbKTM9loStjZJPuV7df5bCU7x9
         OnlvGtvLRXJ7FXp1w9tsknYqhXFBdSVP7PtN3O1XWFSm5hd5XvRl9QTR3p/UMucusizR
         fJSZ6fUeI7WlGakb9t/oKZBRG6y6NtXJBB86zhenkdi+giK+xlUe2TmhSeoHULAmcHc2
         Vp+0kAd1liPEYwoBtPU+d/SWhSs6G01Uihz9yeRaJsattgxcpaPEJj7+QvQMiPMHYgyY
         TDcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789414838; x=1790019638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eZUBkwIq/fO/gxt56/XDzAsEFFKgZRRoosZ19gkheFQ=;
        b=J1GTsN2kVknyCzdDaEHMj+c1Max/oEEuJNkiiyGK2zH0OcZLZMAkbyk+z+/qWhtBNX
         nTmb9FpFY7euvMvL4whqstyqFzLc5f+Sa3nJmIi+Wu6IONirPudVcrSNhcMRa27xSgwl
         pkuwnkOdIq+m/B8u4eaQ2w7BaCzSjZufWFBTLmykU/vu+edqyu211NR+B+2blC9cs4eB
         8IpgIfwKY3T1MFonCwT0HJiLmuscfg8HImF7BrkBhzAjtS2SwO1FAuPvmVaPBh+uUz1v
         aiWtdhG0rbe3xhPUxytNNFeNpUnYrt07A/eIgOIPyuYN+zh/PUCUEJyvLEQD1BeMrwqh
         dksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789414838; x=1790019638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZUBkwIq/fO/gxt56/XDzAsEFFKgZRRoosZ19gkheFQ=;
        b=TYAt+aWyGYapC+cK1jCMxhpvIX5VIx/FslVfUyb+QRemnYiE6utLfjA6uCy+r8JEZ9
         Wskz8GdzYMFXohzjUvb+oyXxRTpx/GXwktn4RzKqzl7xRdgpkFeJhXATU2Fn5Xx0057p
         eju/00IZ2/hQXcKAqgrw8m8GfGeQLLXd7DgcWdTGOURQtEXR8EkxZ+P2NHkwZeFVEteo
         u4dIbcq9DRxNRE39bHqgkvHfceQKzkcqCZlXBmlLKULUpFAhbX+3TdypjihfP5aJZfQ2
         OOZyWBgCw4yG+jn2dW1lcG/v+erezPsJdSE/bMOFJy5RzeDMfhQrI2yXC8VU3snI0qeC
         GZeQ==
X-Forwarded-Encrypted: i=1; AKwUvByxD2GLUGF+UH9eaVVeTldNNQmeH9KtV33z94BwXR35rlRvG8qP6wTh1GrO5U1EIesV/KGI/190pejWjiCfuOM=@vger.kernel.org
X-Gm-Message-State: AFuF++mG3+Nb13xscD4IAEG6R4MKbuTJAWo+bSJYQDZ+vvaouOxYPyh5
	WyvXVfSfCcg9SMfF24NYnV4Yo0ZFyvf7X9RIVkpMsFnGONhpR3sYxVjll2adgXrdPewoE5A66PB
	Jxh0TboIT/hW5MtIZtUd1iNl5aphjEP977UKBFJl1
X-Gm-Gg: AYBFou3HCetGcERjina52RUeTMs7xpZdF1bmrAE93kOBL8wfsrBbRfUqdFvdw19e7G0
	QaMWHScgKzvuHfdjt7T1eNTgmOvUGxJS5NhTwuYP8KA6ouBEuZkIkqROxNeKiNg5kk5IX19nH5I
	syfpnRu7bFHYrDg6BCuLt+V06Be8Mn8KMXqALzK7Des7YmED3F2B1jWm3TIWzvpX8KNh4tdOD9d
	/Y6xBK6y0SaqWk8DMaLcjyTYCbfh/NUjh3V9BDhhWCbxyjsxFcp4bjbWVvCG+6O/oVnJGDbLmFJ
	zsNQHuUA9LJ+B0SWGJ6LxBH+nZyQ6xdutl5kHtggt9n6GWfNaN6lQ2r7
X-Received: by 2002:a05:6402:691:b0:6a6:9d10:f52b with SMTP id
 4fb4d7f45d1cf-6aa043db7d9mr8757a12.12.1789414837491; Mon, 14 Sep 2026
 12:40:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789281096.git.zhang_wei@open-hieco.net> <40f8ac084021e48fbadd5697ef16f674554a4480.1789281096.git.zhang_wei@open-hieco.net>
In-Reply-To: <40f8ac084021e48fbadd5697ef16f674554a4480.1789281096.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 14 Sep 2026 12:40:24 -0700
X-Gm-Features: AcwNN1VTxREYw7yGA-RG3H7Iferx9bVJ6dEoqU2hzDKLAla5Isbu_EYHtunu4hY
Message-ID: <CALMp9eQq0-YwL6-jV_ZJke==J1dHa4YFs+xncN-ue0vr9Me2=w@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] KVM: nSVM: Propagate hardware DecodeAssist bytes
 to VMCB12
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 11:44=E2=80=AFPM Tina Zhang <zhang_wei@open-hieco.n=
et> wrote:
>
> DecodeAssists provides instruction bytes for nested page faults and
> intercepted page faults caused by data accesses.  When the feature is
> exposed to L1, copy fresh hardware-provided instruction bytes from VMCB02
> to VMCB12 for these exits.
>
> Leave the VMCB12 instruction-byte state untouched when DecodeAssists is
> not exposed.  Otherwise, invalidate the state for instruction-fetch page
> faults, unrelated exits, and exits without fresh hardware bytes.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
Reviewed-by: Jim Mattson <jmattson@google.com>

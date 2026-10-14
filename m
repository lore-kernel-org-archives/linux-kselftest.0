Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC2437CD42
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 21:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013058; cv=pass; b=tuWeWJtqkIivVRsWMQaqlu2PdZGPW/Uc+Os7jvIOncigGYgRDUI/fanwXvKB5oeWu+RHeoLiQ9KHHSrrJc/wRpO2Yr3c0SIMOoJUOQD0TKuH4JEKODYsRfJMcLPU6U5rtCoKO1OTAUpNTuMiPilrpDB5VS//GmF597ScAMQRXMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013058; c=relaxed/simple;
	bh=r63gPEMvPL46RQn5CZ3hAGQZunKTStReh88mSxqbHk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueWq+RrzigshYnIWupAuBEVkSJpLP0vizj7TK9A1uTaevdUCMxoSjvoKcq96ELP1tOX55vLUg0bs3d6NXya/f4F1Uj1zj0LuJZCVT7dDKpuVgadAgqDvlQ6Kp1zJFmo+0F44WWsPWW6REOmfjOeCnGLB8boyHCHg3ci+DzyF2Ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b=OWdpkyxE; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.b="OWdpkyxE"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6798d4ab549so1081066d50.0
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 14:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792013056; cv=none;
        d=google.com; s=arc-20260327;
        b=d1VxIJI4A5tn39Uz1zMix4EM4ly/l7hysbJeIYCv2yEt/5Nq7OppxoZXv2AX4FwX7W
         JID1W5rYLvyLuTbqzOnRhAEWiuTzIehZHTEn9ctPKfR5Jec6SsDinIiuqgSemX9Ft/Xm
         zpyFAxyobs6d7HzdtW8JMlTiRxW8n1axYd+SZBX4V7K/mB4awKjFNarJ+i4QHWO3R9YM
         Qq8OZkAl/bOsC0J2LhBoIdzEwUmbaqxgiJMvghMMtQ0sbHIxxJxUT1u6UhakVZlhAtfK
         KW9SQbRAW9rRzi6HxcJPGCKcaMbpqiHi6KX84FXs3BHPoQMNcAaj5MEjt2lXHR1TgqfP
         GLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2r+3eSWI2QRQlHxhWBBPMAcUqGg26+JgtcOo3f8da98=;
        fh=BCrQLOJYGGAokubuArKgp9w32Fkql4wo55SjeOgxNBo=;
        b=QL8aPhgdR3Vxs8czBnqNHP+Xf0PmnY8oJVjTHW9PXILI1O918Z1buydOI+gAkF1aSL
         kQjxlE1ZrQucUSi64YW+JcJ5dUkX+jBwh3gfF2Qi/iGBqLeYNVoRpyZt9+LUo5952ogc
         2k8+oXmoeyFH/MLy7fHRTSShYEQphZKeWwy25dhJqRcAUiCOYjgF/kIWPf6I0InmlJGC
         xab/+ncOdnHKtketdw2+haKRgqdGZkwXrGmW4nc0zrkINcR/MDazgfUDEatbJs0Gazou
         nDIzNdxes//94hAhuyNZDNO+N/wEFnsATyye4c2tO5ngdttdq5bCD8LvRuq6v2LIR1Iv
         9Iaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1792013056; x=1792617856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2r+3eSWI2QRQlHxhWBBPMAcUqGg26+JgtcOo3f8da98=;
        b=OWdpkyxEJ5TnzcjENDcaA+a7fHg35oYRafNUrZqSlKGyEEAngECYDjQOTtuf923wJI
         uXITMvx3ZKGLV9MB06KrFKv6lglH9cRt4rd1U/ajJRCL5CCq9VJ399wc7jml892IunRH
         otivvuTloqHrLmKPDITwXC7mnD9NG6kl0RBPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792013056; x=1792617856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2r+3eSWI2QRQlHxhWBBPMAcUqGg26+JgtcOo3f8da98=;
        b=LRx+kdcsBQrmUVgh1BeRlUH687GgyGVXJum8YBDV9OzzVt5lseGdwcN8YnaS6m7a6W
         zIedkuHAE0zcngadFvZ030ZUuiPQsd8g7vqPK/QetJ53shZePsEZdPX4hgl1Zd0TXpOK
         IDikKIydDbW9RqrMc+NTuUGm5HNRSd2UZpvjDWmj/GOGJn/BAbUE4P05SoUzhGGOYquu
         1BCRPhGERYiluxTqU4xSH7k/DQAq3nCQq8FQkA6QqW2SZT5hcjVTME7Ih7tBGmkUmpSt
         fxfx58UOYMM9hqfb1vAQMIf+RHbeuoU3OfVr+uk7qJIMbNdvJA67jxX1D+UzwgQhzSoK
         ZW7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxi/abTEyOOBM+2SeNENfUmqqvGxrkuJ8MzQzJs8HzkvNICo7rtOu5+5X1JZlLn68kZI25KvKtWCFKujU4ZpAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbixw1Q6yntwriDVkpHwhth1VxNP1hv9E75WuZ5W3+yA9/ina5
	hzZRTdJyyfZSHoDG3N9He2IH5wpFX+7XGirvjym/TekDhGLhbZg/8a4MFC5drhW2RB7hDkdvzLK
	IFqk2wiN5tSDkTRGzC1Q8wIYtKV+gL8ZVH8dLXiZp
X-Gm-Gg: AYBFou0yNrq324ziS8M94EjeQHJlb2hvZH/wMK5JAacKMbUuPjBxLuiNWvbHK14xp5t
	fPERraU6uAAe4Ub1M17XhD+hgGFpgr9W2QUDfUVm9wZaD1OhiQqhuCNL9YIJ/g5/RGZACKerWFK
	nY1TqwYxWMfzBzIeA3fHz/5G/JnZBaCLO2Cpl5yv9NpxMudubv3IPh2GoNTVpcUmQLrf1hLtlj1
	64edPdwtgfyWbxZJWZU5DrGNmpqRg5LhfTcfFzSNmRA+6IyNLjMNeIZJTetD0Fs25LdgzWp0cuK
	5JXSF4hEExam+IBFc1xJggkVp6ooTLyCwWKhmh6FkwiPVMdP4jI/wcBkufUPPqbNPbsd6Q==
X-Received: by 2002:a05:690e:d43:b0:675:3f33:b183 with SMTP id
 956f58d0204a3-679362745a0mr6171135d50.24.1792013056258; Wed, 14 Oct 2026
 14:24:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014121414.2373985-1-ivecera@redhat.com>
In-Reply-To: <20261014121414.2373985-1-ivecera@redhat.com>
From: Victor Nogueira <victor@mojatatu.com>
Date: Wed, 14 Oct 2026 18:24:05 -0300
X-Gm-Features: AclHuK_VTAdZZkQW0BtcsHxlVRXv9pULtYyY-Xyg2W4k_wvNoU0bv1qIgpz4UTg
Message-ID: <CA+NMeC_dh5k-WQ52q8JOqYW46=dzT5EKnwuc=kLs7Mr4g25ZuA@mail.gmail.com>
Subject: Re: [PATCH net] selftests: tc-testing: use $IP in hfsc test 8c39 setup
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, 
	Shuah Khan <shuah@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 9:14=E2=80=AFAM Ivan Vecera <ivecera@redhat.com> wr=
ote:
>
> Test 8c39 brings up lo with a bare "ip" command. nsPlugin runs it as
> "$IP netns exec <ns> ip ...", and as tdc runs commands with an empty
> environment, "ip netns exec" searches only the default execvp() path
> (/bin:/usr/bin). On systems that install ip only in /sbin, like Fedora,
> the setup fails:
>
>   # ./tdc.py -e 8c39
>   Test 8c39: HFSC classify walk still reaches leaf after lateral drift
>   -----> prepare stage *** Could not execute: "ip link set lo up"
>   -----> prepare stage *** Error message: "exec of "ip" failed: No such f=
ile or directory
>
> Use $IP like all other tdc tests do.
>
> Fixes: 1e24c4f2ee44 ("selftests: tc-testing: add a lateral-drift hfsc cla=
ssify-walk test")
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>

Reviewed-by: Victor Nogueira <victor@mojatatu.com>

Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9278538D68E
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774014117; cv=none; b=mMC6YpYuHZclPRMZF33ejLgVATPvB91yG/gs3AbRYrYTOC4IsjgYgQlK/zZ0YHq65WYlaTok1UXvET4U6y0NL337qEgydwLu+0QCSlos6uwsWtuy/ORrJRTyzmDBNLTe57yFO6bBocnkfExZSY7KDo286hNIZq0GjS2Ww9CNkoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774014117; c=relaxed/simple;
	bh=WwESOdXDfmYShiieGLB63KsCG1PufYfWbMl4RCcvGqs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gDyg/jZFMkiJXDLtCAjS0xGNjDvuXZsIglD3gXXlM1zVQQy6eW5cA+C1H8JZvAABXqokW8J7CW8GmxtLaqnquVLa+9K85hZShKiyT3rZpqpR3hIP7lBHsizOd4TENwwWA6u/tYs6HSC2qG5UA9HWifmAtZUhjrzKsNqqEikGItI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OWBGUbg8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OWBGUbg8"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b9b190easo1523557f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 06:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774014114; x=1774618914; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pj4MC8T5uD6QbNxS5LtnCZJ45IF95A7XBuXQVLse3fo=;
        b=OWBGUbg8U7yySiSCsxCepQMPYLJwrEvvQZFPl/LXDyJqx2oSQv9MTYxlMigm15oA+v
         heebIcvE/1YiwYzyphFdX98IS2vruSIZtg3QUQGaAwkbKNbxaeWrz3fyS93lB+O8DM4j
         ymEaC3Dpm2J22gYfiZX/SL0ufH6qvnslQvzim5/CAgIbR0CX2OXOF1iqV0S8cz4mOITS
         W+f2MvDYYOA8KpoZ9NXaRD03/jg3cpOHE+updLYJKmfLT9gzWdM7E28jbR+LLqJokztt
         g9kwAawFDAU6Xn4owOSpDGTIREZH/zd+5wVh9yaWZp6WBDP7TEJgfg5l9DCvBBzrqqdx
         jiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774014114; x=1774618914;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pj4MC8T5uD6QbNxS5LtnCZJ45IF95A7XBuXQVLse3fo=;
        b=NJJc/sl4rZhvAd6GXeUmN3YJyGvaZ3Q+ZCpTbDLScelcF1N2SvYDTXMQDbYwsR1CQm
         Q24BhFvGbk3kRox7LTQIn1Ez9Y+5W/ElEkJZyG9hKzUxqVRPxmhSBb/hdHYb/mZyIBlZ
         FmmBr8qXeFCbfhg4ClqjiZwBUA794GqxymWsdzd2BMBRsxfbrXteHqL+8pAHQ+jF4LPl
         jIJ0APIIhX5oQ9uoNkCJugLei1N7IXABmAh/40tFO16JJlkAr1qQLdGyHY+u6P7Hviwa
         H6q84pQgP2rcSmLfk01zjI3iQ8adoCIOELJgAG8VzuM9eLdnVQa2+4pFN0UQQ+JZyN5v
         oqNg==
X-Forwarded-Encrypted: i=1; AJvYcCVstTg3fWZXdsB/MQDSNZssYx5zPITdw+b+uIvcKm0n/Z7kPKXRy8iwBNPUrzz/hf8jGo8ILI3nugBeg+mOjGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPCqI/skuAADHDcnZM9a3uEa0e2hSSg2AbuJbEK4ilmZEtSvFj
	c25zP/P1Bszar1hbILu6jGUFJtlLFAC+y3xBAj6kZHyWIR+hO12wiSNAFmIQLrTTAUg=
X-Gm-Gg: ATEYQzyoOfXh6TEJmkKbi/Pf3UjDS20qnPE8YQTqBqmz4aLqB2QtE8UTTVu+6Ogg6vg
	bbW+He2KAfq2c+luvv8Kne5OhA7/rmp3th4nkEbUC74dvfcM7Lw06Taho9REL3cAUuHOxgCu5lJ
	1WP1/PURp3hwWtovVVM8iuEthCLjIu5L2nwpOBlQHtY0JIDYDLhimltBBTWFzLYLKCpAVoRZrsL
	4XKkHboX7I7pAcZNlon7TIbWr4aQJ3QBl5KgCoU9nXgH+TKEmBG16uuUp4Hnzj+3tjO5FNj7SJL
	Wa8ISDe2YUTIFDpRP6nn9QYtdwaOvn6q9ga3S/DIeoyQY5gtwKu4WjcA+oWUt2KXvOnwQjPry+z
	BoyuppRpCbh32ecc6uZ09dBAYxaqKDIInMQ7QBkTUStVnPBkNcMYCPyn4RSi96+lN+Tb/V3o/Kb
	GPiMgWoM+WFiaztv0wV55r7juhjwuFAbkF/anB7FtRvR0PHRtpLetxalKrtQjY4frPHMw=
X-Received: by 2002:a05:6000:1788:b0:439:d8e2:9a40 with SMTP id ffacd0b85a97d-43b644851a3mr5725374f8f.55.1774014113733;
        Fri, 20 Mar 2026 06:41:53 -0700 (PDT)
Received: from ?IPv6:2804:1bc4:224:7800:585c:db3a:fcb:e21f? ([2804:1bc4:224:7800:585c:db3a:fcb:e21f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b647177e8sm6628376f8f.34.2026.03.20.06.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 06:41:53 -0700 (PDT)
Message-ID: <ab5946563beb7551a65fa9b1a4ff78cd48ba4b24.camel@suse.com>
Subject: Re: [PATCH 8/8] selftests: livepatch: functions.sh: Extend check
 for taint flag kernel message
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes
	 <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>, Shuah Khan
	 <shuah@kernel.org>, live-patching@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Mar 2026 10:41:47 -0300
In-Reply-To: <ab1K6oR06sLm9LM_@pathway.suse.cz>
References: <20260313-lp-tests-old-fixes-v1-0-71ac6dfb3253@suse.com>
	 <20260313-lp-tests-old-fixes-v1-8-71ac6dfb3253@suse.com>
	 <ab1K6oR06sLm9LM_@pathway.suse.cz>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-03-20 at 14:26 +0100, Petr Mladek wrote:
> On Fri 2026-03-13 17:58:39, Marcos Paulo de Souza wrote:
> > On SLE kernels there is a warning when a livepatch is disabled:
> > =C2=A0 livepatch: attempt to disable live patch test_klp_livepatch,
> > setting
> > =C2=A0 NO_SUPPORT taint flag
> >=20
> > Extend lightly the detection of messages when a livepatch is
> > disabled
> > to cover this case as well.
> >=20
> > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> > ---
> > =C2=A0tools/testing/selftests/livepatch/functions.sh | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/tools/testing/selftests/livepatch/functions.sh
> > b/tools/testing/selftests/livepatch/functions.sh
> > index 781346d6e94e0..73a1d4e6acaeb 100644
> > --- a/tools/testing/selftests/livepatch/functions.sh
> > +++ b/tools/testing/selftests/livepatch/functions.sh
> > @@ -324,7 +324,7 @@ function check_result {
> > =C2=A0	# - filter out dmesg timestamp prefixes
> > =C2=A0	result=3D$(dmesg | awk -v last_dmesg=3D"$LAST_DMESG" 'p; $0 =3D=
=3D
> > last_dmesg { p=3D1 }' | \
> > =C2=A0		 grep -e 'livepatch:' -e 'test_klp' | \
> > -		 grep -v '\(tainting\|taints\) kernel' | \
> > +		 grep -v '\(tainting\|taints\|taint\)
> > \(kernel\|flag\)' | \
> > =C2=A0		 sed 's/^\[[ 0-9.]*\] //' | \
> > =C2=A0		 sed 's/^\[[ ]*[CT][0-9]*\] //')
>=20
> With the upstream maintainer hat on:
>=20
> I am afraid that we could not take this. It is needed only because
> of another out-of-tree patch. It does not describe the upstream
> behavior. It might even hide problems.
>=20
> We should maintain a SUSE-specific patch against the selftests
> as a counter-part for the patch adding the tainting.
>=20
> Or we could try to upstream the patch which adds the tainting.
> Well, we might want to limit the tainting only to livepatches
> with callbacks or shadow variables. IMHO, only these features
> are source of potential problems.

TBH I wasn't expecting this patch to be merged, but I send it anyway
since the change wasn't big. But I agree, we can drop this one from the
patchset.

>=20
> Best Rerards,
> Petr

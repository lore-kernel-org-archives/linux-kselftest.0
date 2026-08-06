Received: from mx0a-00206402.pphosted.com (mx0a-00206402.pphosted.com [148.163.148.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E64442A799
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 15:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=148.163.148.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030324; cv=pass; b=KEOy7H6QjqpRtRxF7tOygNvyWUvPXNFWbCjXe3s5IxKi5vzMKKqDhVCmRc9QYqdsNTIPbbLK3s0UnuvlWUHz+Ugkjdlpl/eYzb+KUr3XiA0Ku3Nel4WJp1mlCySJBWbgFAaP269ul4PQFW5hJWaJmZGYwCGWV2XQJG4zCuJMoR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030324; c=relaxed/simple;
	bh=q1yKAchAKLYq079ovpGA477d3rJNusw7Xe8p+FR68lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nALN0/IDocXjL0YIdWY0KAx64Fgdb1ex6XE2D/Bc69iDsM158BnkQCTScw9cx5jJBWYvq3SgMLTqBQPtEfjn5mzxZ37gzjmwqQrGHBn33cZcxhSZNMw+5FJlzKxc4JfT/2cew1Seh4ZaHnYyZ3Nb2FuhZSLlT54iVAmRwqpgt8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com; spf=pass smtp.mailfrom=crowdstrike.com; dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b=cD4zTm5M; dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b=jUwr7YyE; arc=pass smtp.client-ip=148.163.148.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crowdstrike.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b="cD4zTm5M";
	dkim=pass (2048-bit key) header.d=crowdstrike.com header.i=@crowdstrike.com header.b="jUwr7YyE"
Received: from pps.filterd (m0354651.ppops.net [127.0.0.1])
	by mx0a-00206402.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676F6FK24162565
	for <linux-kselftest@vger.kernel.org>; Thu, 6 Aug 2026 15:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crowdstrike.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	default; bh=c2fkWs3IPyqlvD9JKIug3ApdmdvPne7OgC9UgDf+NxM=; b=cD4z
	Tm5M17fPCDrNyQnDpnqttK1cC6kuMPVg4/jD/NafaBCKl0S12uY23MLt8b4AzTR1
	tNtAlGU6iP65NOCAbZGM/AFS1P8A8jFJtgC+Gka/cS6al6ZUwTehMeQPyb49rJQ/
	ju69mZ7d/ia/w2ssTJghneL2trmQpwiu1JI2o4ewFKbpqsE6YwXRn0dDomX5s3g/
	TzyMqV1CTrn8xM9VTU4dBjoou0s9LDokE/Lr5b8h6sM33N7AXcM7VGNgAH/pGgMd
	cZseJx5SSRaCvi1pYSw14VZx4tyjkzymIS24edQKmC4N7Wsh7W7pzQS0ATIUeCok
	yJesokBCRMEHIY5+8g==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-00206402.pphosted.com (PPS) with ESMTPS id 4fvq5k9nvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 15:32:01 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-667656a12c5so5928072d50.2
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 08:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786030320; cv=none;
        d=google.com; s=arc-20260327;
        b=U/Xasy09ytNToo7TU3nqDXYFN3F0kuRcL4HUgLszHgYMS2gSvHS9g5iuQU+MD9tXJ2
         UbhJfPjiPKTXf0zJeBvSwZChBSSH+KxRN+WGr6vy6puLuMQL+vTr9ks04GdHwJRCydQ9
         s0R9qaWwx3nXR6gi6WmQT8AZ65OVna3nTDpaBU7jQCOGXK62aWTfhwhDBWeuuiEuukz3
         8/Da+JCGuWkJCbqaNTe04OP+LxHX6sz1bIfek5GWtJkU4Z2YsvdYFvs7PTk0rBwANVnJ
         L7KmMM8r9hUydcjV5VOWchm6yw61zZnrCkq99tru7jx/SJXB+CSAxUCDTa51Ft3v4Mi2
         fH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c2fkWs3IPyqlvD9JKIug3ApdmdvPne7OgC9UgDf+NxM=;
        fh=DGDl7iqR8tL7MWH1MK2QPHiCzOATaumJ7rU+UBHcHO0=;
        b=K3kTgNnNXrYA56EpXvYwixiNjrdNl66XXe9FSBxMr+NoMUiik0fnUevZe1Ssu+ALlE
         Y4U3GxCcclqBbnuniuGaFBaX0K1Y0I/uBaVz9k1d930RtR2SDmZqnIbFLTaqzlFqHjYY
         wzZvHT2S14/9CeJILm4dysnNSy7XspxzzMX5u3IbfeEpRaqhf23HhG0uHJBvyxuyZuLW
         1SlnXgkHR9pbT4NFgNZAuPGDHh95IzV8Rbq5dF0DH3r8ZeDLryX+12piqO51oO82lgyr
         fDc9ViIguVwQF/xEgzL7ILcnWIo3IRFxtclzWrS13cbl6QeyCiYtXV4707lonUNAMmw0
         BMnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crowdstrike.com; s=google; t=1786030320; x=1786635120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2fkWs3IPyqlvD9JKIug3ApdmdvPne7OgC9UgDf+NxM=;
        b=jUwr7YyEutR2ntg8mjiTkWr8G03wYaEMxMSDpwpeIO060yep4vdjVdLNRvdpnYyHTh
         Q2ja/+7W1N89qUtLLHRF2mQFXrKXQw1q7TKbCzzFGzCy8phwlVgFemybh4MsP+CUcdjM
         lH3nwDnpqcmGChjsCbjpWZo8NYW4J3mXH8mmmFURQgcdbKZ6uwkM5LI8SnhJQM7acml/
         nJF1EDne5owqizd5ct1e56AakdqqUXBYpxOm46SB/gVYfEap/FbxbnM7SCuYg+6J+inK
         m/vmdXVQn4/+CKbdIOqRKB//rjFCjK81hRMhXyWjyAMGfCvtjZljQDehl4TxvX+xCLXI
         vkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786030320; x=1786635120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2fkWs3IPyqlvD9JKIug3ApdmdvPne7OgC9UgDf+NxM=;
        b=Rsk6zvmzCBmYzD9qMenaEP50kd/A78nqN1R+HR1aLh1kLEC1lVPKTOj2x28/4lf2Cv
         DNVJqqoqHhyIm85VMh9+Soy+fAXXy9vcQR9nvQhOtkUMDQMNzsd3RjgegQKBYBtct6s7
         yMZZTXarNK23jYZ1wI07wVU4cb8AfarMqch8PftCaf85v9/7xn0UclPgLyEhC1NqGIy4
         ssvHt4JIOZwisnQRLVLW5BmAWcGT3jB7bhGO5j504asmLOFj3HUCqNrA1F7ilMnckYcR
         FEaksrXFaVh+JzZW7oIJD2sJXXqDCGY0Jp8kXJSOOU8j0soZ8HpjDi/I/kUTGLptksWO
         vfDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOAkFcEzmDa7A3BuXRvswfi3DW6tn1wbiQgFwz/PDmOl3WJt4URfuKhyUex/wEopRU1XkcnEGbjtVM2gDqjZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2/l9cO1VxKRGPgjUjBWceLz/ziDwGKO9L+Xvlmx7xW6TIcuL5
	fJdAZR55TkIPPDrHWb1QMoDTDgreL5UAwFWnVLDryCeTnaFpXH0wOFQMfaXAF1caW7fs1E+K5At
	3AkW5T4G3Uy3qbFSp+4kzTr+UoG+fOau6MUG7DYrE5N9sng9QwxZhRFX8qf7MIUGphixgiHuJIG
	Ih+Bj9bsp8y+Bqx+OSP7vW1oFAEcfQGiCTUsmfo+Yg6+ZE
X-Gm-Gg: AR+sD121GWqjJJT3XZoVKr1kxHsEjwl/AanqMFdQa4db3bIh5JfXyIYa4STnuV5mRl6
	2w3/NSBjPitI8xnAYv6PAwYqB9aNhHyoaEVPLA7E4ME2LMiWhkmJciifxDD8dE8IF1wAZU2f2zM
	U/CLd9suYGBjBk0dDR35/Paa4+1suBj9lnWbPsL9+IVOWUhAVLR4iN2AlGig==
X-Received: by 2002:a05:690e:488a:b0:664:bd5c:6e72 with SMTP id 956f58d0204a3-6699aa7511dmr7229014d50.34.1786030320276;
        Thu, 06 Aug 2026 08:32:00 -0700 (PDT)
X-Received: by 2002:a05:690e:488a:b0:664:bd5c:6e72 with SMTP id
 956f58d0204a3-6699aa7511dmr7228964d50.34.1786030319671; Thu, 06 Aug 2026
 08:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731175358.3542156-1-andrey.grodzovsky@crowdstrike.com>
 <20260731175358.3542156-3-andrey.grodzovsky@crowdstrike.com> <am0-QoUNQo4p2sBg@redhat.com>
In-Reply-To: <am0-QoUNQo4p2sBg@redhat.com>
From: Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
Date: Thu, 6 Aug 2026 11:31:47 -0400
X-Gm-Features: AUfX_mw1nwxsETix0HLa6WjJrBSSAU1_0A9CQBJUP5Fq4BDIA8mjk_ZZNVuhTmY
Message-ID: <CAOu3gNhFL+1JmWRVwJVq4xUn-8mENkNwYexCwpFZ8FaZY82SRw@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next v2 2/2] selftests/livepatch: update
 test-ftrace.sh for deprecated ftrace_enabled
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, rostedt@goodmis.org, mbenes@suse.cz,
        corbet@lwn.net, jpoimboe@kernel.org, shuah@kernel.org,
        jolsa@kernel.org, mhiramat@kernel.org, stable@vger.kernel.org,
        linux-open-source@crowdstrike.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDEyMCBTYWx0ZWRfX/QEAOlyvcgG0
 6WzRNOQpD5yMgBMinyNRVO/QJYFpiZ3ZzKtKxrd+dUu87phS5/BnVA2RAMmh94YRdozcBMpjWOk
 nmrtNYi855zxkMlukP2SFqO12/PLL4FVR0TRZMHwE7w/H/xVtx97
X-Proofpoint-ORIG-GUID: _BLucKIDlp6gEEKuR65w4ZSOiKYrI57U
X-Authority-Analysis: v=2.4 cv=QfJWeMbv c=1 sm=1 tr=0 ts=6a74a8f1 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=KZhmPCYDdY0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=T2KQ53IYiC3MXPrxx8bB:22
 a=b3B37AjAgz0HnGB3MuNd:22 a=ngmC-yC5AAAA:8 a=e25ExAebAAAA:8 a=20KFwNOVAAAA:8
 a=meVymXHHAAAA:8 a=pl6vuDidAAAA:8 a=dDW-ktzWsA5qhXuJ1JwA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=P5XVh-r7Nk77isVNjX_M:22 a=Fx-rEtueDibNKiZPBj-h:22
 a=2JgSa4NbpEOStq-L5dxp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDEyMCBTYWx0ZWRfX2qk/kx70fdDN
 dlNCV/hG3wnnGeJKooO5frU3DgStCdKrBoIhBzCF8PyFoNspilJs04aBV9hcczUedGSoJ7xHPzy
 qR5pNoh2io19C8tHE1P74Pzc9lU05rL3AUN+iMVojrxGELjuavcRbVf8VHiMfJCFgieTV8nkFh/
 SKF7SfcmutF0vFtHdMzSVEeCLRjnsEoUiFirGSsVmtb1AuB66R6qDacUm1zgvP468bbTEKxXMAF
 lTLr/NUpeEpa9EHIz0FAt825QW6DSigRiM+z6vIJoRQprMPDAiC1ksRnm+rVlBWAtYOmIEAWpmH
 22r/N4hyGliqMJPxuLavksU6rhna9lHtu7jkXv5W+jzfgA7pZIu1VzdTC+WdC9DRGPaVWJAfce7
 ZhO0GlnvKm0Ok2Ctfqx6s+yklulZfUWg/uP9fE+9ipfd2CD1gsdjdl1vqUNn6WUp1niCtDFgtlw
 hlhoC+nvIp9khMqa+EA==
X-Proofpoint-GUID: _BLucKIDlp6gEEKuR65w4ZSOiKYrI57U
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11867
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060120

Thank you Joe and Steven for your comments; I sent V3.

Andrey

On Fri, Jul 31, 2026 at 8:31=E2=80=AFPM Joe Lawrence <joe.lawrence@redhat.c=
om> wrote:
>
> On Fri, Jul 31, 2026 at 01:53:58PM -0400, Andrey Grodzovsky wrote:
> > kernel.ftrace_enabled=3D0 is now refused on kernels that deprecate the
> > knob, so the old disable/reload flow no longer applies there. Probe
> > for this with ftrace_disable_supported() and keep the full original
> > scenario (disable, fail to load a livepatch, re-enable, load, confirm
> > disable is refused while loaded) on kernels where it still works;
> > otherwise just confirm the write is refused.
> >
> > Suggested-by: Steven Rostedt <rostedt@goodmis.org>
> > Suggested-by: Miroslav Benes <mbenes@suse.cz>
> > Assisted-by: Claude:claude-sonnet-5
> > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>
> > ---
> >  .../testing/selftests/livepatch/https://urldefense.com/v3/__http://fun=
ctions.sh__;!!BmdzS3_lV9HdKG8!zXXcFqHACaJ7PyoFMFh-_8DFTwWSotPltPcR5ezYC87Va=
VkoNZcqFkVTtLbYUQp4DKEh9Z-0WLN8c5sMeyug2BCCuslAibAtHJo$   | 13 ++++++
> >  .../selftests/livepatch/https://urldefense.com/v3/__http://test-ftrace=
.sh__;!!BmdzS3_lV9HdKG8!zXXcFqHACaJ7PyoFMFh-_8DFTwWSotPltPcR5ezYC87VaVkoNZc=
qFkVTtLbYUQp4DKEh9Z-0WLN8c5sMeyug2BCCuslAJf9tNxM$         | 45 ++++++++++++=
-------
> >  2 files changed, 41 insertions(+), 17 deletions(-)
> >
> > diff --git a/tools/testing/selftests/livepatch/https://urldefense.com/v=
3/__http://functions.sh__;!!BmdzS3_lV9HdKG8!zXXcFqHACaJ7PyoFMFh-_8DFTwWSotP=
ltPcR5ezYC87VaVkoNZcqFkVTtLbYUQp4DKEh9Z-0WLN8c5sMeyug2BCCuslAibAtHJo$  b/to=
ols/testing/selftests/livepatch/https://urldefense.com/v3/__http://function=
s.sh__;!!BmdzS3_lV9HdKG8!zXXcFqHACaJ7PyoFMFh-_8DFTwWSotPltPcR5ezYC87VaVkoNZ=
cqFkVTtLbYUQp4DKEh9Z-0WLN8c5sMeyug2BCCuslAibAtHJo$
> > index 30dc677b2f45..7fa4bda70221 100644
> > --- a/tools/testing/selftests/livepatch/https://urldefense.com/v3/__htt=
p://functions.sh__;!!BmdzS3_lV9HdKG8!zXXcFqHACaJ7PyoFMFh-_8DFTwWSotPltPcR5e=
zYC87VaVkoNZcqFkVTtLbYUQp4DKEh9Z-0WLN8c5sMeyug2BCCuslAibAtHJo$
> > +++ b/tools/testing/selftests/livepatch/https://urldefense.com/v3/__htt=
p://functions.sh__;!!BmdzS3_lV9HdKG8!zXXcFqHACaJ7PyoFMFh-_8DFTwWSotPltPcR5e=
zYC87VaVkoNZcqFkVTtLbYUQp4DKEh9Z-0WLN8c5sMeyug2BCCuslAibAtHJo$
> > @@ -126,6 +126,19 @@ function set_ftrace_enabled() {
> >       echo "livepatch: kernel.ftrace_enabled =3D $result" > /dev/kmsg
> >  }
> >
> > +# ftrace_disable_supported() - probe whether kernel.ftrace_enabled=3D0
> > +#    can still disable ftrace on this kernel. Newer kernels deprecate
> > +#    the knob and always refuse the write with -EOPNOTSUPP.
> > +function ftrace_disable_supported() {
> > +     local result
> > +
> > +     sysctl -q kernel.ftrace_enabled=3D0 &> /dev/null
> > +     result=3D$(sysctl --values kernel.ftrace_enabled)
> > +     sysctl -q kernel.ftrace_enabled=3D1 &> /dev/null
> > +
> > +     [[ "$result" =3D=3D "0" ]]
> > +}
>
> Small nit: AFAICT, it doesn't really affect the test pattern, but it
> would be a bit cleaner if this function restored the original value
> instead of always turning it on, like (untested):
>
>         orig=3D$(sysctl --values kernel.ftrace_enabled)
>         sysctl -q kernel.ftrace_enabled=3D0 &> /dev/null
>         result=3D$(sysctl --values kernel.ftrace_enabled)
>         sysctl -q "kernel.ftrace_enabled=3D$orig" &> /dev/null
>
>         [[ "$result" =3D=3D "0" ]]
>
> --
> Joe
>

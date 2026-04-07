Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6590E3A7F68
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 10:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557469; cv=pass; b=i/kzauoaEEAG9I+YkGW9/7VfUuBDdDdIPSHBfzcOH3WkNloq2RnaOW3PgY2fzwaght29dlP85WAFuZT2wSnh1s6DE9GLfwPYLcOSdyTQtg+HIcFTsExcCUqz7HvUk/Fd7M7/4/PbwbujnqfKf9qj9PqHEAJ4vQhnrr8zmAeDEuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557469; c=relaxed/simple;
	bh=fVyaiPhNLlkTRJtGFMUc74d3HCEE4yi+6NDJQOmgi0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p42um+gMqSxGU5i5d4hF83d4rKzRRrB5/g48tM2qASRlRJOWx/+pRvaCHUOldgcCnS1WRw+U7kI+S0IJZOX/7SGk/3N8nDd4Pro/f+OZoXNkxtFQW5O1JYTxjh2zkpAvHzuMjsPW1QlCiN3BCViECZiaVCCs/vUHqV/xhZP+lBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2MIiNGA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=husQJB9U; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2MIiNGA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="husQJB9U"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376hqEV3815234
	for <linux-kselftest@vger.kernel.org>; Tue, 7 Apr 2026 10:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LHVvsYlB8yFKLNRBW/wwq0r8jj7ohWQtXpAtE7f3oQQ=; b=X2MIiNGAbQ9NY8xK
	F4YJNJZXYglJYcXsQGUSb+vNLx9be7UiA7wKrZEOdTH1a6tXk2wiRQT5rjSgeyHX
	UDJMWbUvbPmkkUmlXXWWGFz5nVMnqudqNGHzCvHaJ1FdVqSDQOLBtnvPTNhQbHAd
	oJCKur+CmSRA1Hr7WE9vvPdJwuEARhgSAeIKBXqrfxDrcg9rAZrz3ZBy3WxKVkW0
	IVDZspMJ3XzwHmWIz67p0ubAOJHorACJgpmSq9IdebStFpldr6UREVSv7WccrzbW
	I2GQ3eL0X3nqiM7qUE4fJOhMNCv2ME2Ug8++sVSIvvpVYkE7qYRspiE/xriLaqIP
	WAOEOw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4t9a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 10:24:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89fa878662bso47348736d6.2
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 03:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775557467; cv=none;
        d=google.com; s=arc-20240605;
        b=L0wg0q99OVbiW/YwqSosxTW+z0SQtp8ABRRlLK6XBLaY4wIzEmCSB+VjmO2ZoMjRYv
         TZ8i00/O7aJ5FWp6GQP3H7ZYL6Njo9/RaxVgMI9sXV2mktfKBdiKlqlf55mgUxgxj44i
         lhvPpssZN9g6huqgsBG6dDddIVaE10G/bN5VWOgZ6xUozhcoD5ij/vi7kLmEX/2cDixZ
         RAsxwtW0uoiB2zokmnjc5VtkO8kwCn+CdL1DLuUtxfDaFHZEupgWLHWq97FhQsNf4NYQ
         GcKHz5A1YgRkN7VWX354RF4L+wsROxB3gKlWD2LuXugQV7kZEVOXLL8zU6oyjAk8ZZ3u
         ichQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LHVvsYlB8yFKLNRBW/wwq0r8jj7ohWQtXpAtE7f3oQQ=;
        fh=hXaUXnnY8FQsgbh/6Wr/3i9z7JL2JMch2QXMV9Fz6v8=;
        b=ATcuXkM3W1vg88HsAcPrZL9OVawXqQz9hjlqpOKCQozHVEq2axIYIMzZop1cqBnMV4
         C4idBr0pS6DrD9HZ5NlzYQVKUYDUirJgZbT3qzpS2QjbutrNAc7LabY/QuSTv1//9s/p
         jFyzTksJt+x2MRMo5qFNEptI9IVnOyhjPr3sx62kxumvyxwKFzDqa45B5zGBJ2/cMfdJ
         Q39bx0EtynMw4botIx3lql+D5JZ467wJKPxs43+XWu1aY+J6EJieTCfwN97+eaSqbvxL
         TvZoFnKzTj9a6+Y9dubWeGMQAjR+lZvDD4Hf+2nbs6BZOQ6Up0ynBKHTZ9usFOdiAOiN
         QlTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775557467; x=1776162267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHVvsYlB8yFKLNRBW/wwq0r8jj7ohWQtXpAtE7f3oQQ=;
        b=husQJB9Uzq6FZlgRPtTKRvyeiZ0jfJjG2Wi6REZ5u+MjHJ5VEaCu9V1eNOePtzi8nH
         mBOWA9JMHxbWDaY0nBlg4wpskke2E7jRm547tvIoFfoUe5LLB4lvR307wlKZu0d8L+xe
         c7xuwtAP/i80CAZarlX+FjOiX7dmczMu8j8q8BQJ0dyYq8JC1CuuIHTDA5Ap/LQ+NAAG
         dIiQ17xnL4ilL494PDXpsYkNQy3POBQLgOWecRuKfTEhvqASqdslmzkmqxDrC8lImtDz
         qjMAUSzXk6HcpyrSItdiFnfxZtSN+MBNsH40bs4AbAb19kGS4asmt6s3mK4stJQSfNrP
         07nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557467; x=1776162267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LHVvsYlB8yFKLNRBW/wwq0r8jj7ohWQtXpAtE7f3oQQ=;
        b=MiaGhUOpd+ZaZX0/ZguWIANhlGAOc40KMWeOHC3p+Voiwi/+gLeDXTKBSq8N69I0dJ
         NKstHESvXH5rnkzIZ+mqQ1ItOzQ+ZWewdydPVMQse0CJr4mi2sOoArrDJogO1AUcd28s
         XcAglkO0R5QotVBcL0dgNS17a2LURqV6/yBcdbeHh1LzWU6KMl+/AkFwc/G7zNAs4jPq
         OxrmsIGFC7dkVh7JMKvkRTvAZtK21thawxfh4NAp5FOBChGbjPSgjG5EmUdl7D1oOih/
         8s2Ti0Y98tVsxlY4J2LY0k8+biO9WRf1pHLtd0qUxClQCYIPD6QCm2uGNPlDthDrhPbJ
         YKYA==
X-Forwarded-Encrypted: i=1; AJvYcCV5TxEWDXRrSqi6EaSpF7Grq5YVvThVr89HMGEEqEEUyxReSgEIlFgKeaV8B9jSIc1XwXMWmmu24O06L6V96vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwchYRVb/9j6W3fJGYCmmTpRo21Rm/SSJ/zchIrB0mDkZonpmqn
	6q2bCm8L4VNa7vcnSQHGFeb9autG+B/209oH6G59SVUvTZqaauu0OiaAyVSrnlBL3u9jbhey5Eg
	qOQIESullqmNIp/otlolTaovdV2aQY+oKvMRuyxA7dM+lCuTOIVv3domMGt0p1IQK/a62rDsVVE
	6TzwhngZ5HyCg51LE+lis82ghs55PIX1RpWRW3TPb7zDcwQg==
X-Gm-Gg: AeBDieuw6D0OEXHUqjNYr68PVAn90vgAsUaH/tjPyCzHZiketVt3CKETYbTgOGnh0lu
	kaIzdSIWhqhjORIrJEzGTG2ZW1hT8JQHCmaiOttaWZVrU4E2BAdhA6mIvtrdh2eyD0V3DZHg1n4
	OTND28The/LSH8GXxwGYbuq3QNFPsMNe778EmzVqwDvS6q+MWSJBBcsKJbgUoLmDfLwgLv4ljwe
	dHOH6o=
X-Received: by 2002:ad4:5d6b:0:b0:89c:8709:d238 with SMTP id 6a1803df08f44-8a7042f7e3dmr251197466d6.40.1775557466713;
        Tue, 07 Apr 2026 03:24:26 -0700 (PDT)
X-Received: by 2002:ad4:5d6b:0:b0:89c:8709:d238 with SMTP id
 6a1803df08f44-8a7042f7e3dmr251197166d6.40.1775557466331; Tue, 07 Apr 2026
 03:24:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402102953.2984284-1-mayuresh.chitale@oss.qualcomm.com> <adQ7UZVG9rQ1mOTI@google.com>
In-Reply-To: <adQ7UZVG9rQ1mOTI@google.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:54:15 +0530
X-Gm-Features: AQROBzArI6PeoNrpcWBNjAlyiYrHyctMnM2KUzuCLf9-tLS7msf1I6SzG_PibWU
Message-ID: <CAHuiULAivSmzwyqDAhSrUUqUMiYmH=UuV9LKz8P9vy5G0xTKjA@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: memslot_perf_test: make host wait timeout configurable
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d4db5b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=1XWaLZrsAAAA:8 a=OZTLbhzomWAjmCbyawoA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: rapRW9-HW4ax10v3oQbYItSVdXuItH4J
X-Proofpoint-ORIG-GUID: rapRW9-HW4ax10v3oQbYItSVdXuItH4J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NiBTYWx0ZWRfX+yWbe6H1tbXs
 3Jzvum1lKGIsFvEXRln7Iv9WK9DCXJA0nQ+cml0HLaLPnPhkkp8aqNKPKu6G+DNJmeBmag9FBOh
 +HcX2vFrtJHNrS5n0ikomU1URrW5z89Sq6YFdbM7cFWOP1uI3pxKGvopel6z3CW6oHFeHy5tz6O
 xbc4NbVe9T3TSznQueRjiPZf0u9HsS3xLMndV9DE1wD9o3EJd6SHDhnuweK8bZbWK9E2JwokW/4
 Cd2mdylEnPR+M6zWdvmVtFj4hTpDG5avPFmvmRPVRy8ifoar9EPcnysiCqEEYPbYz+rcelvFhIo
 TlzK25IEOPF3EdWeZVxe6h3oo4gC5T3bFVRyHL9u/qSmgGOXqpd2X9yqjAJoDIy7eGJ29dv6FXY
 fBRAFQWAnGgpeRBvCou9/dCQUMELfe28RAC+P/qWDAEda8pQ0Xjt4gKFvfRz8Np5tsk5A6zKQCg
 uLyRLjzhKrFzUAhoBmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070096

On Tue, Apr 7, 2026 at 4:31=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Apr 02, 2026, Mayuresh Chitale wrote:
> > When memslot_perf_test is run on qemu, sometimes the RW subtest fails
>
> For posterity, can you elaborate on exactly what "is run on qemu" means?
Sure.
>
> > @@ -900,7 +901,7 @@ static void help(char *name, struct test_args *targ=
s)
> >  {
> >       int ctr;
> >
> > -     pr_info("usage: %s [-h] [-v] [-d] [-s slots] [-f first_test] [-e =
last_test] [-l test_length] [-r run_count]\n",
> > +     pr_info("usage: %s [-h] [-v] [-d] [-s slots] [-f first_test] [-e =
last_test] [-l test_length] [-r run_count] [-a wait_timeout]\n",
> >               name);
> >       pr_info(" -h: print this help screen.\n");
> >       pr_info(" -v: enable verbose mode (not for benchmarking).\n");
> > @@ -916,6 +917,8 @@ static void help(char *name, struct test_args *targ=
s)
> >               targs->seconds);
> >       pr_info(" -r: specify the number of runs per test (currently: %i)=
\n",
> >               targs->runs);
> > +     pr_info(" -a: specify the number of seconds for host wait timeout=
 (currently: %i)\n",
> > +             wait_timeout);
>
> Why '-a'?  '-t' is available, and seems more intuitive for --timeout.
I was thinking 'a' for 'alarm' but 't' is better :).
>
> >       pr_info("\nAvailable tests:\n");
> >       for (ctr =3D 0; ctr < NTESTS; ctr++)
> > @@ -964,7 +967,7 @@ static bool parse_args(int argc, char *argv[],
> >       uint32_t max_mem_slots;
> >       int opt;
> >
> > -     while ((opt =3D getopt(argc, argv, "hvdqs:f:e:l:r:")) !=3D -1) {
> > +     while ((opt =3D getopt(argc, argv, "hvdqs:f:e:l:r:a:")) !=3D -1) =
{
> >               switch (opt) {
> >               case 'h':
> >               default:
> > @@ -1007,6 +1010,9 @@ static bool parse_args(int argc, char *argv[],
> >               case 'r':
> >                       targs->runs =3D atoi_positive("Runs per test", op=
targ);
> >                       break;
> > +             case 'a':
> > +                     wait_timeout =3D atoi_positive("Host wait timeout=
", optarg);
> > +                     break;
> >               }
> >       }
> >
> > --
> > 2.43.0
> >

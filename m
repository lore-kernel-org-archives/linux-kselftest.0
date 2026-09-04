Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DA63BF69A
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 06:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504307; cv=none; b=BkmygQyS/2yngImZMCnd3dFWSCJWE4Ho9V/JG4Gk7VLO2rBhWpTXcsN1VN9vigW+C5IQPAm3IVunO4EqZTnQg1+xjD4HB7LALkmF7TUgyBDwfaYlQKqn2y2g3n/0nn8Uop/ROngWEHGGjZZD1iSg/ir73zWzHuYiKHGbMZe/5pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504307; c=relaxed/simple;
	bh=il5SDGzSroiv1J+pWOeZCKm9F9pkOt4m5uwdQzS9Yy0=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mzJm20d1BiN8ZMmqzBlsSEEeHMLs/RpQtgrYQqBMgHgTNnbtql3bH3g5TvGAzbVno55yLRvKSwKBvBoasm2DC+YZTThZJmS/vsWkmqyjEtK/285wP5I3G8dk5Escf7jDqmufU74TLs2GsqwCmqd2bjn4TZ6zdGb8rxpPt+7tPMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kjqIsIar; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kjqIsIar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F8B1F00A3E;
	Fri,  4 Sep 2026 06:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788504305;
	bh=nKwUxtimv/wI+AwaWa363nd3/PNMeo0CsX0gpMXwo8Y=;
	h=Date:From:To:In-Reply-To:References:Subject;
	b=kjqIsIarl4eNHzyaWTeJxfC6ahljE8s+KF2QCzpcA49HvCMGWhExPKq2HjkG+LcJQ
	 GEf/1yZxDUfNxpzYfn1mvxg56zgakG7Q+sDuy6XrCsfh5akzdz7gVvcEaQndDxbIHY
	 6Tb5w9zD6mCkaT5gYvO3jpM5v0Yl2QV+mASKsVEvmlZlgZESzu0DL2pxFA0fCRMu3j
	 AVjIPsFA51NeBb7MkGiu+55ofQvwu7gssjtsYTdg98I0JW6nQU5hxy6yIxY5KQXSmn
	 A8kWGbHkrwaWnJdQX8Ob2af4P9k1UwOuMXP3iIPkKTbmkrj/x5WvlxXGpuBC53mZLq
	 Y+fvAyz3Am1sA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 58F001980045;
	Fri,  4 Sep 2026 02:45:03 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 04 Sep 2026 02:45:03 -0400
X-ME-Sender: <xms:7Wiaas5rMYkn7JTgkZc40uoVw8SDLFQrfKEHd-e_bes9CYfSw-EzdQ>
    <xme:7WiaaovOXLKzVJi651d-6gYpNr3a1QLVV9y73ZiqhxF9dOzHoyNEEJZh629I3975f
    goCBJ2b1ZdYbJSNbRrqp5253EMOySuV45Vvdy5mys5MB5dbtZv251L8>
X-ME-Proxy-Cause: dmFkZTFxk9DWTLRC40KXfKUz34UY2nZ2Mbibw0in5bu8LkYEmCfTo999zbuP1SoqXlo5xC
    2ejyFLlwwGeytc/oTq3kZQUYIdzeTd2m1YRdDB3DdKwXlnY8KhIHXFj1nHLwuPeLKU5GPT
    rGBPvlgVkEOz/uU7wxwHSQ+a6206WHFKAV396USSgroBaQjdJhE2k6oYYhtfY1IUHA/Yx6
    4WQGy14jZBIrbc9HgyGP0hJKScCmnwGgVzBtmX5ZfcT6kWXah2J0NOchX1dUO/TTVgbBp1
    FoBBBOG8l6+K1zVapo6+LNPV8fAJSKIa5vHPEAPdysp9DQR28YCa/oWfeWw5/ArCOLs2Pg
    WhZztDHrVfRdca+W8Id2VAFiwLfY2AUIcHSdBMsTQH/ZpaoV+4w1qNNUn5ay96+mBjacEP
    mahx0lwdmCQI/97CLSrz6PU5GEbMJHZygABOg4mVke5/AGrDqbmTMjDq/7EjwgbFcPsr3t
    vcNYlEpNrHkmQm1ha8+gRzgIcGh3oNZumjwu9zEhqWCDvmjRos37LaMtfZLPrlAIUeey8J
    48H4i57JOK8eFgsbDbo1iCKbVLVU+RQxyy2hBRQrkDYOwEGvkGWiWvsgB3LMMMtLQ9nQZ8
    HqeCJZPvYdgVvYcFq1rPWKNQkdiDtOwaKFZ6c03kQ/fim49ekPkrYy6npPAg
X-ME-Proxy: <xmx:72iaaphPPl-OXhsyjh2mHkzxtoncjmahNGkl7tSeQ2ffQQubKGjX3g>
    <xmx:72iaar2BSpIK_ZdEUWfMan4r-Fpbgs4y5uyHSxTF_F4ZCv-CLwr70w>
    <xmx:72iaajhBxmeoa3CPBHVdhYzBcAIygxjHFOvDpgyz9Q0G2QaRub2hfw>
    <xmx:72iaardiOEykbgTOyZChbQBCbaWFiSc6CNK8rc_PHZzfSozusV5QEQ>
    <xmx:72iaammFUVfGB-Sx5D4ZyEua1S937v97Na8vd2j0SM8s2UT3QKwa-HzY>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D8A09F8007A; Fri,  4 Sep 2026 02:45:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 04 Sep 2026 08:44:40 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Hui Wang" <hui.wang@canonical.com>, shuah@kernel.org,
 "Shuah Khan" <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org
Message-Id: <caf1ec53-fef7-41c0-880f-7e403a75d3e7@app.fastmail.com>
In-Reply-To: <c1d93383-aed9-4c54-8ad6-d8e3361d73a8@canonical.com>
References: <20260820030101.35982-1-hui.wang@canonical.com>
 <9352c070-753a-428e-90b3-5293f1bf3e8b@app.fastmail.com>
 <c1d93383-aed9-4c54-8ad6-d8e3361d73a8@canonical.com>
Subject: Re: [PATCH v2] selftests/efivarfs: skip write tests if efivarfs is mounted
 read-only
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Fri, 4 Sep 2026, at 04:06, Hui Wang wrote:
> The previous mail was rejected by linux-kselftest maillist because the=20
> html part is detected. Fixing it and re-sending the mail.
>
> On 9/3/26 17:34, Ard Biesheuvel wrote:
>>>   run_test()
>>> @@ -74,7 +82,7 @@ test_create_empty()
>>>   {
>>>   	local file=3D$efivarfs_mount/$FUNCNAME-$test_guid
>>>
>>> -	: > $file
>>> +	: 2>/dev/null > $file
>>>
>> Why is this needed?
> The test_create_empty() will be run on read-only efivarfs, and it will=20
> print [PASS], but it will also print some noise message with read-only=20
> filesystem like:
>
> --------------------
> running test_create_empty
> --------------------
> $(TESTCASE_PATH)/efivarfs.sh: line 85:=20
> /sys/firmware/efi/efivars/test_create_empty-210be57c-9849-4fc7-a635-e6=
382d1aec27:=20
> Read-only file system
>  =C2=A0 [PASS]
>
> This change is for suppressing the noise message and make the output=20
> clean like below:
>
> --------------------
> running test_create_empty
> --------------------
>  =C2=A0 [PASS]
>

That does not make sense.

If the file does not exist after attempting to create it, the test has f=
ailed.
But I suspect that this fails even on a read-write efivarfs, given that =
EFI
does not support zero-length variables.

Please fix this in a separate patch, or leave it alone. Don't paper over=
 it
like this.



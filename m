Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F02543E49A;
	Tue, 18 Aug 2026 15:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068305; cv=none; b=LQgQzrL8BYm0dQVf7VL0AQUMwyJ6P3jfvJNdBwivk7jXIjnjyT3EsbgiREBokNnRDOc6+V0VJSKMwNstt4ShYWH3r2GYBum8JaoiNJAyROOJoEtXlQf/5l/pHAqm5NIXGwvaQ4iP7DjEhLuNOPLlfZmRTLsFqceTX6ju3CzIVp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068305; c=relaxed/simple;
	bh=DrLBsuXyNWPjTCzO0MxXZGWnucWgyGTOxM3zo7ivl20=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I55vCzR+Wf3gezg1I7DkMNGtR+QWG6LnZXPhuHXFWRbA/sHq1Mt8SWjELocbFI3UcwGn2wIrbu/tQemOKzuPAaKLKzhlc8W2Ttinf33tf6k3ZYtrsAN9D7ZvtuOAj21TnEnuWNc1q5Nf8h47vUUfppF384wxiJZQpH4+OaIMn00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=pJGT15zU; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="pJGT15zU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=qvHH7RVe4CclXuB1cCAlX4rfMcsyKoGxLN5MAiXyiqA=; b=pJGT15zUB3R0cZAeewUb9BqJPX
	90PrkQW/cQNAj1oDhrciGLPLUSlzXJTESnjlcr49AjtlGU6RbTiZT5l85w7IsdC2/2bIKU0IGr2ch
	j/8rFIlylQhK/dke+/W7Hdt6SD5HqEAtBS7oqHqsQ7amhe6dGaXq/TyA5/mvagNV8ew3MrQdPhAdD
	krvPWlZs6ScIo9tHRKV0jUj9PioucZdnVVF0SW+zrzQ1I3yl3xgh64Qmz2PpyjMLeQMNuqCp1Z8uS
	ylKG9yr4iU2dWTuPu0E6ROLjC/09YWYY1MkMjX7pLFh05a1vSYW754njw3Fn5onRdfAlSTOSSTzNF
	UkUIProQ==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwM6C-005h0d-Oo; Tue, 18 Aug 2026 17:51:36 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>,  Chen Linxuan <me@black-desk.cn>,
  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  fuse-devel@lists.linux.dev,
  linux-kernel@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Matt
 Harvey <mharvey@jumptrading.com>,  kernel-dev@igalia.com
Subject: Re: [RFC PATCH v2 0/8] fuse: caches documentation and testing
In-Reply-To: <CAOQ4uxhoOKC7XyK7D_izd-=28RC2OA0Xmjf41rhhO2kPhM7F1Q@mail.gmail.com>
	(Amir Goldstein's message of "Tue, 18 Aug 2026 15:13:07 +0200")
References: <20260817141156.6079-1-luis@igalia.com>
	<CAOQ4uxhoOKC7XyK7D_izd-=28RC2OA0Xmjf41rhhO2kPhM7F1Q@mail.gmail.com>
Date: Tue, 18 Aug 2026 16:52:02 +0100
Message-ID: <87jypne89p.fsf@wotan.olymp>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18 2026, Amir Goldstein wrote:

> On Mon, Aug 17, 2026 at 4:11=E2=80=AFPM Luis Henriques <luis@igalia.com> =
wrote:
>>
>> Hi!
>>
>> I'm (finally!) sending v2 of this patchset.  It tries to document (and a=
dd
>> a few kselftests) to the different types of caches that are currently in=
 use
>> within FUSE.  As I mentioned in v1 the idea for documenting this came fr=
om
>> Miklos during this year's LSFMM, where he mentioned he would like to see
>> caches usage documented before he could merge an initial version of fuse=
x.
>>
>> This version documents symlinks, attributes, ACLs and readdir caches.  S=
till
>> missing: dentries and data caching.
>>
>> I'm still sending it as an RFC as I'm still not sure if it fulfils Miklo=
s'
>> initial goal.
>>
>> As usual feedback is welcome, as I'll (slowly) continue looking into oth=
er
>> cache types.
>>
>> Major changes since v1:
>> - Added more caches to the document
>> - Changed tests format to single self-contained binaries
>> - Since Amir added a new fuse3-based test, the conversion to fuse3 of the
>>   fusectl has minor changes to the Makefile
>>   - NOTE: I've kept Amir's Reviewed-by anyway (should I drop it?)
>
> It's fine. I trust your judgement.
>
> Please see Sashiko review comments.

Sure, I will do that.  (For some reason I assumed I would receive an email
if there was a review for my patches.  Looks like that's not the case.)

> My main concern is with the doc - it's not an easy read
> and I would have liked it to be and I found many correctness error
> which is not a good sign.

Hmm... OK, I'll need to go through those errors and try my best to see if
I can fix them.

Thanks a lot for your feedback, Amir.  Much appreciated.

Cheers,
--=20
Lu=C3=ADs

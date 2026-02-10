Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AE0329E56;
	Tue, 10 Feb 2026 13:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730613; cv=none; b=oHE5MX5Ldx6hh3a5msOmtKSydcouOrUwr79azw/AQ1l13KuEVkVFWJGUeKmJ8d1+7Y7A8MLr4vyOJ3w0GGIPWfGL8fSj/zg5NBOSiooBNerQGMKw2CnmCsu9qOQiNhCsgEDFWLLOEDNXlWjPCxUMP3fc324yvTMCzgSV563ofw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730613; c=relaxed/simple;
	bh=XvsVHmXgB2+jGFb6YS8QQQ6oUeNSCspDyi2HthD7WhI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O0Tu4YiuhFQc7ukgQ6iL9AccsgzCXer9Bc1aJxe5kZRI7pY3yz059GeyXF3xJfupRL6j0LutLz3q+zlnPyBdUu8FYxnpPdquZrw2kIKFUixX8IR7/GNefnmZZchZAPYBb1XTsErJbIMFncAAghIfzNGL7fI0E+0939aMS5daI5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2ZWaqcD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2ZWaqcD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67066C116C6;
	Tue, 10 Feb 2026 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770730612;
	bh=XvsVHmXgB2+jGFb6YS8QQQ6oUeNSCspDyi2HthD7WhI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J2ZWaqcD1CsAlXKJRUBGX6uNdaZxBjXPTVV8R2T1A8UkKjj8diU6V0BOdzx7c500E
	 qeneZE4Pesfgv+FsGQZeZM+qA+rmuQnrADW9kQjNFQeRn9XCGgYfaVNee7yAhSLA8+
	 5wyFR+2ZVgiKyvrxGzhV37VFZ0l7M711hDt1D9GgAGsVKFrda1iNT4xw22ZzzGMmCD
	 Pck5QWk45FlLjvAetTptJPxBvbwgZipCK6ixjjkIjr+YLQOFtitcbfL16kOhon3LSF
	 PJbEXx1XeJ9iG0rBWDB0Wed6yuDcg7Ro3bS/xrGiOJugs7++i84UNOMm3JsY9Pymmo
	 AWFJ6NKkAxi4Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: pasha.tatashin@soleen.com,  rppt@kernel.org,  pratyush@kernel.org,
  shuah@kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/1] selftests/liveupdate: Cleanup kernel optio
 CONFIG_LIVEUPDATE_TEST
In-Reply-To: <9da09064-5005-4b30-8f9b-9ac9b9858d46@linux.dev> (Zhu Yanjun's
	message of "Thu, 29 Jan 2026 20:31:34 -0800")
References: <20260130042840.1469-1-yanjun.zhu@linux.dev>
	<9da09064-5005-4b30-8f9b-9ac9b9858d46@linux.dev>
Date: Tue, 10 Feb 2026 14:36:49 +0100
Message-ID: <2vxz4inou3da.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29 2026, Zhu Yanjun wrote:

> =E5=9C=A8 2026/1/29 20:28, Zhu Yanjun =E5=86=99=E9=81=93:
>> The kernel option CONFIG_LIVEUPDATE_TEST does not exist currently.
>> Remove it.
>
> In kernel 6.19-rc7, this kernel option still exists in the file
>
> tools/testing/selftests/liveupdate/config. Thus I send out this commit to=
 remove
> it.

Yes, but the patch to add the config is in mm-nonmm-unstable. I am not
sure if this worth the churn of removing this and re-adding it when that
patch lands later. Do you see a real problem with this?

>
[...]

--=20
Regards,
Pratyush Yadav

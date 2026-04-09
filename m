Received: from outbound.st.icloud.com (p-east2-cluster1-host1-snip4-3.eps.apple.com [57.103.76.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41A230BF6D
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.76.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741946; cv=none; b=QVizIkykg3Tdaf65BYaoUl/Eb1VohtxwhHJpXDvsnB3G7Z9Ne2nDKgo7LAKpudv4DidseYjMTD8XEL6WwUVal4HaWb8UgVWc/J7kQUPuyJnJ7DOaCF23r8vHqo++RmApDLdrYN/E1aCo0HTQYfyMUTEbNh1P8GabKereP1FX9Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741946; c=relaxed/simple;
	bh=nGCJwnO/T8oXVr++nHwKIsYdOEYFiJ8jSK3HTsBsMlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KipYo7q5z1MMwyxr4IwJQogGFmGDY1sDKElAeDMHbjmi2yx0jCbTw22IiWA7laVa9rZj0RM5JFQCIK5z30Zot1ocvxrxFrYC9tFlaczxjbh7x7s1N9MPCSCotP1xDoWYxk6vgEKuRJx+jsoz62DmRHL0T2hWj5lMfJ6PzV0n6rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net; spf=pass smtp.mailfrom=y-koj.net; dkim=fail (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b=mI/j5RMv reason="key not found in DNS"; arc=none smtp.client-ip=57.103.76.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=y-koj.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b="mI/j5RMv"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-1 (Postfix) with ESMTPS id 68C9A18001CE;
	Thu, 09 Apr 2026 13:39:01 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=y-koj.net; s=sig1; t=1775741943; x=1778333943; bh=3K6yqxE829OM9Ye31d/IL06X6QQ9Q0zTmuIqBC6E61M=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=mI/j5RMvEA1x2LqqWVWM6o2OiK+o3zJXo8zAEWMLXnXnbXLp7m63sOM17TYHU86i9nPkEJb+K5Q9j6hn8xP5rg1HtgX2r6AE4sfDEUQ3xrd2JPz/aMzW5ukKMkPba0+r/S4LLnRj8OkxnqczP+rlsZObPf/Mvw4Abe8DJ48pxmRInj0jRyYTnWPQ9lwKjYwFAcrp+OHwS22bgwQbJ7KDVKtcaJTxzllyr1gFapqkm18/oyJhySRuDbKPmLwmMlVPEDbtGYN9rxRKe0UxPSFRR48SqVyO8lgvoyCoMgZ6iZEaM/Z/Y7V8X+9mL4zJYfpWXzOUoMTJcLoT0RYGmAiRFg==
mail-alias-created-date: 1719758601013
Received: from desktop.y-koj.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-1 (Postfix) with ESMTPSA id 6AFAF18001C3;
	Thu, 09 Apr 2026 13:38:59 +0000 (UTC)
Date: Thu, 9 Apr 2026 22:38:56 +0900
From: Yohei Kojima <yk@y-koj.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Shuah Khan <shuah@kernel.org>, Brendan Jackman <jackmanb@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: runner: Avoid spurious warning about
 missing failures file
Message-ID: <ader8C3F2uOY7ro6@desktop.y-koj.net>
References: <20260224-kselftest-fix-failures-file-v2-1-2bfb8f5cb6a8@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260224-kselftest-fix-failures-file-v2-1-2bfb8f5cb6a8@linutronix.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEyNCBTYWx0ZWRfX5jpvsmve8cfz
 y/NM0nG69iJTfbMQrBqV9FjUU/DLMvXvefC7CX76VQgoKsNiYefjozaf1DrSKnraWZBu4riyWFr
 Y6k5C9cPn7RpTcScxRGkJ6iKUXo218oIxmQxWX49FVdTZNFqoZ1vctsf4JmeZF2VF5t3kjnG1ZX
 5sNQU3STCF3lrbzHl2LTe3LvS8HE6p4p3SWIuBP7oXcT5BLK/l1MJLSOeMkuszmOsvox+wgBuHx
 tCTIXtSnOTqkYREdKAsTrYllG4W3m+fdnHwm7r/2j4DxCGb3WsM3Pv+OpSJj0W1ITgAcvgOpTEo
 LwNEZHWd0VMRUcdfp9NIv/wKE+1+6axMFFN+G+AYQXTNZTa4DWw1zWU4CU7gD0=
X-Proofpoint-ORIG-GUID: R19fs9-MwMNhT8n6FQh5w3iabXSL9Jc-
X-Authority-Info-Out: v=2.4 cv=GsNPO01C c=1 sm=1 tr=0 ts=69d7abf6
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=8nJEP1OIZ-IA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=jnl5ZKOAAAAA:8
 a=-HkndCELG-luoUfjG6YA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=RNrZ5ZR47oNZP8zBN2PD:22
X-Proofpoint-GUID: R19fs9-MwMNhT8n6FQh5w3iabXSL9Jc-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1030 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=959 lowpriorityscore=0 mlxscore=0 malwarescore=0 classifier=spam
 authscore=0 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2604090124

On Tue, Feb 24, 2026 at 04:37:56PM +0100, Thomas Weiﬂschuh wrote:
> When runner.sh is *not* executed via run_kselftest.sh, the variable
> $kselftest_failures_file does not exist. This triggers a harmless but
> annyoing warning from runner.sh if a test fails:
> 
> tools/testing/selftests/kselftest/runner.sh: line 50: : No such file or directory
> 
> Silence the spurious warning.
> 
> Fixes: d9e6269e3303 ("selftests/run_kselftest.sh: exit with error if tests fail")
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> Reviewed-By: Brendan Jackman <jackmanb@google.com>

Hi all,

It seems this patch hasn't been picked up yet, although it already got
reviewed by Brendan. This bug is also mentioned by a netdev maintainer
and several developers [1], so I think it would be nice to have this
patch merged.

[1]: https://lore.kernel.org/lkml/20260112135326.7ce71119@kernel.org/

I confirmed that it still applies to 7.0-rc7. I also tested it by adding
a failing test to net and namespaces selftests, and confirmed that the
error disappeared.

Tested-by: Yohei Kojima <yk@y-koj.net>

Thanks,
Yohei

> ---
> Changes in v2:
> - Rebase on v7.0-rc1
> - Pick up review tag
> - Link to v1: https://lore.kernel.org/r/20260128-kselftest-fix-failures-file-v1-1-b58072c66317@linutronix.de
> ---
>  tools/testing/selftests/kselftest/runner.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
> index 3a62039fa621..1eb935b6f790 100644
> --- a/tools/testing/selftests/kselftest/runner.sh
> +++ b/tools/testing/selftests/kselftest/runner.sh
> @@ -47,7 +47,7 @@ tap_timeout()
>  report_failure()
>  {
>  	echo "not ok $*"
> -	echo "$*" >> "$kselftest_failures_file"
> +	echo "$*" >> "${kselftest_failures_file:-/dev/null}"
>  }
>  
>  run_one()
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260128-kselftest-fix-failures-file-8b38692c2a3c
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 

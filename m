Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746091;
	b=fKhxDBgQ7u2e8WYDO2rjArUTxqfpPOFJbQuxDcElp8A6xfuI6JqqH5w+5pxzw4L0asTx
	 FjLRU4rcT1rLeA6XlEa78xU2/Vd2r9kXArVgyTX/u2AVYQ7j23fEyfLp6IygreRQyGAuh
	 FYfqp0pRVof3fDDRE8JDvyhJtyE/0v4IBhKZfpMpuLhCLhS6XbZqaXKkGM983rQ4ywC/k
	 8XyAx1sof9uiy3OEHknL2vTILKcRs2/mldZ5OYCiEynXFPHSpBYLolIoC2JkAet3LeyAY
	 48uSk1nZEYXTCu13O33IQJU9yDJ2I0jzBcjQhKCy6qZWG6OZVmNOt6a7Xk2+r34CgHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746091;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=o2ET3ecSGMD0ZeNmKH7c+QB7Isg9jdNrey9dY+vrz6Q=;
	b=Iz8pF7TLSEdctaF0xkvCC7ruN6EU+P4FvF6AZbc7ZLiF3f4WRlbC/9Mvp+pIEsoagNhr
	 d1Lr/SH8VQ2XI+vw7Cgmu1M58n0urm2PXyqwihMs4WwEZWCX2lvYv3Z7gIwP6GWPwnSSE
	 Z6RpantvOAshwR9MB0MFAGaa95ec6sza8sHRaOCzGHMlA71EZf060JuQ+0L0uhiYl55LY
	 W1uq42PEr8bJAkM9B9fx+FZxyE16Eu1lGXTVRMf82Rm2ouW075u+GBm+2V2lbPzZrGD1s
	 jOeWHRvP4wEDUnbxkVLfVptgDjTTMy/xMgeY5m/mhOd17CEUTFaeOALztVRalVjYKWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=HJzMCNv0;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=IsV2yIgG;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D90606A321;
	Fri, 27 Nov 2026 02:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D90606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=HJzMCNv0;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=IsV2yIgG
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795746088;
	bh=e7s2q4YjPzq+CftyBULIg4QzDfvyNMtvgTtksST7XZQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=HJzMCNv0haYeigprWrbLG06ZYLOaDMbDgJp8B1wKYgT6YfkGx+eIuKxpthgBwQZCn
	 N9FqNokHQe3Yux9PQ/dY8n+IQ+ZuUK782o7WloaLRLIoEUEqVp7hqcSfwZBJGOMbPO
	 CdRMSEEh3SN34JbxjhufHYB+Ssg5J9HAPkUL32NlaAb6pxCd2E6iaHDtQxvEtze/pD
	 1VzLmAgZfpVyVViDppLUk9FoStKgS+4TS04WgOYrOnkO1N1HRGdeiEdMhdp7sX0IRC
	 K4hFYp3t+IdjFuUMGl/ym5TUrrnVgc98Zz8OrYl6ukO/MForXoQk3v6T0OueeD9aCc
	 Sp0iZWG4523N3wyb5VIS5G+GYL6J9a05xDa6HqIO2oUN0KjSZK/Sssv/dsTSblexly
	 WmPnFUiP8dSCnYp2DkUS8AlYyAOA+mERvIIRzQAp8OcRrhm6KxtqVkmwPrb5H8KXph
	 Bp6gVediGUB1GM5Fjkhp2gFjYHc5mGOYdRnCUKpXyjEJ++WxLUq8ZBLPSKGRTImPBE
	 esvbRx7v85OAsBAHRzHgfOMh3+Jyx9ZX9DTqdwwW2VHlSirn07NCcgZ8rMsbnyjjv5
	 ULZ76uiUMUrYzDXc6gObt0UK2+iq33AmNzIoMs6whAHlw3RFG8sfkAcHqtgHAhFpnw
	 0VTIMxCn/GyCCiCK01OlqW+g=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 39BDD1EADDC; Fri, 27 Nov 2026 10:21:28 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795746085;
	bh=e7s2q4YjPzq+CftyBULIg4QzDfvyNMtvgTtksST7XZQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=IsV2yIgG2oSVAieNd/6Sr3wfxV3BwAqrbklK4zcS58X8hjwI55j/ODgb8G5863KG/
	 SFqmGg+vYtmpo66fb/hJ0GTiYBIwrEBhAGXwXURIzsXeNrbBQGqz55euhlqTjexHk8
	 TEtuKB86UoXzmR1xfPMb4Iuiuvth1gFbPBtMNbvxKJsp77xOBmVXzL0EzNbwEQD7Ee
	 2Sh7RIFce44+ThwcyeJDlytVmbATBGUOxPhisbT3hEG6F1ttF8T1e/8QddtKOKidGg
	 XRRaQ1ZzV0+24ypJAmm0d0aAWXAiXcykUau1+O2Yd4OCJiFVYhfJ4AVO3qsesYVOC2
	 GGvFrF3uS+P3kJOXE41nx4Xh1WhwiYdLhK0eYSt2Vt9Fq8hxVdTPsuzdVv/3TplFPc
	 paxMOwhGT9BweyB032oJ1Qk3bGEPl5VXrhhK069Csnbym6hN1TYOxXWdUUWxngdxjC
	 Qs0MGhodzb5OW2LGvb0PnLFtQN1o7H9QbBnbKg0up0qTms+I0tX0Zwuex+Pexu4pFb
	 ym/jatshmO0CzCp6WffseR4o+HXvbU081m1cCu3AsBsypUdrfWyBaZrMfOJAIhG3eM
	 I6xb7WB0ovqC/BYbU505YkyyUUR09yi7aoqKn+vai3y0Ca2Vm4xVg1vGYagpQMAdoO
	 XLD0Hz2wnyWkdZLyTamTmD4g=
Received: from shelley.lan (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id D4CA61EADD4;
	Fri, 27 Nov 2026 10:21:25 +0800 (AWST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RESEND v2] kunit: tool: Preserve suite ancestry in
 JUnit test identities
From: David Gow <david@davidgow.net>
To: Daniil Matus <matus.daniil@gmail.com>
Cc: David Gow <david@davidgow.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Rae Moar <raemoar63@gmail.com>, kunit-dev@googlegroups.com, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
In-Reply-To: <20261126-kunit-junit-classname-resend-v2-1-9b64a461fd86@gmail.com>
References: <CAJeAFep5wgtRpHwANoeqJkWE38y=9zQQ9e7moQw-3rE47b=wFw@mail.gmail.com>
 <20261126-kunit-junit-classname-resend-v2-1-9b64a461fd86@gmail.com>
Date: Fri, 27 Nov 2026 10:20:57 +0800
Message-Id: <179574605708.1202103.7943504441342768927.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1419; i=david@davidgow.net;
 h=from:subject:message-id; bh=e7s2q4YjPzq+CftyBULIg4QzDfvyNMtvgTtksST7XZQ=;
 b=owEBiQJ2/ZANAwAIAcYipzoZDNtCAcsmYgBrCOkYvamYY+4xaGFDK8JZZzRQtsqNMwnJpV5hg
 ic8b0U3CPmJAk8EAAEIADkWIQSmmTCaqhqZOsxDGC7GIqc6GQzbQgUCawjpGBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQxiKnOhkM20JTow/+K9N+22GqVNggE3T5mptAZGQTpbU3vtZ
 LoUeCL21CU3qxkec1dYYbD5SRY4qww44cpAcrpmYXkMKOaBNjpVHf+AFJgLX6OFmT/JAVyfIwu3
 mWuqajlERxRTXXZCq5kcz+qHgHwMp/8sWGsUDMzB3IOI79WEumtGOE5BLrsTkoQ2fP+qyt857gi
 BG33KA8FLYFa7aaGxNOCA6dxdNqawD8SA+LkKmib8+CiDx3G4NAmdPhra/sAce8Jj24EXYZF69C
 5q5iQ+VIxAY+qjqjbMyI79DK3aAQD5OfcWV8l8SWCZ/GYmIg139DQiVuRFfLsjDzOew93qx5K8C
 CIE9VWOTgyNiwXLCYU69Kf2OJ1uKKV/ZjS9ZV4+FHpbWQd5XUt6xVDCk+sQbZmroCxLRl7noDQ+
 xeveAqpxGpmAe//2DtJnM+YL5aYCUtY1aADe6Sy6cjNZ09j4qt4xlanCnNMXfd4CR/0+4+dxt8E
 aZAqU7JRNkYx8dZIGEU5GBXQLkRapNbsVrvrrGxVntFmJYX0rXI6s3qATZLnIS6NJtZwLbBnh7O
 Y/XnHz9NgBeiyE1WrCISmCcxtBlb4fHImp1q/fg0axs2Cw1ohPSDPhRUuo7nBi/Tz4J6v9pGKoO
 X58blrjtRrXKsEVw8xLdzuHupsaIAlTTEVAJAU+3tXNzwS/qFlq0=
X-Developer-Key: i=david@davidgow.net; a=openpgp;
 fpr=3B0A53B1D9DF6AAC59C230322A821C5AD66AB03F

> JUnit testcases currently carry only a name. A parameterized KUnit test
> becomes a nested testsuite named after the test function. Reusing that
> function in several outer suites therefore produces the same immediate
> suite name and parameter name in each of them.
> 
> For example, cs_dsp_test_run_stop_callbacks is registered in four cs_dsp
> callback suites with the same "all ops" parameter. GitLab identifies cases
> by suite name, classname and testcase name. Without a classname, these
> distinct cases have identical keys in the imported report.
> 
> Set classname to the dot-separated ancestor suite names, including the
> parser's main root. Preserve the existing suite hierarchy, testcase names,
> statuses and logs. Add a regression using the existing nested log fixture,
> whose seven testcases otherwise have only five distinct identity tuples.
> 
> Validation: all 92 kunit_tool_test.py tests pass. The new regression fails
> on the unmodified generator. Comparing all 24 log fixtures shows no XML
> changes other than the added classname attributes.
> 
> Fixes: e9e05c72752f ("kunit: tool: Add (primitive) support for outputting JUnit XML")
> Signed-off-by: Daniil Matus <matus.daniil@mail.ru>

Thanks very much: glad to see this working with something other than Jenkins, too.

Reviewed-by: David Gow <david@davidgow.net>

-- David

-- 
David Gow <david@davidgow.net>

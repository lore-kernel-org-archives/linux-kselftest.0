Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3B245DF63;
	Wed, 12 Aug 2026 14:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786545428; cv=none; b=giUX49aYvR2Tt0wUCfwmHnGVkWPLc0L6w/1q6Woh5j9KHNYZQTPMYOCdo9aPj3skcjyyYjcT4MXPrjt1hBsP2P9GTeQP24WY84XEX2i/QJZpB6u3p8g/YRRMhz0Pgdjc8CWDuv5DPdv05Q3hmLnk0nC/JcRaM1GZxwuncGoT8MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786545428; c=relaxed/simple;
	bh=q/VLEIZU+aB7xjVcGGID6u7eKoT/yhuWE8xSI2Y/mq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3nN88eY1cdHuEIIKQiILXqehxh7QzzSi4kvGAOxaI/jWBbowl/pMLRzqpZJb3VyMYAgAPV+f9LV7b46ZupmJ42Tz+kB5E/8s6tXz2en7nySUX0/p3SVL4ghxcFsQwDdfcQYVE9llhlni6106v6XEtj8AW6VB6IMrIS+EsNgb9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 232DE1EA8D6; Wed, 12 Aug 2026 22:36:57 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8802:7000::9c4] (unknown [IPv6:2001:8003:8802:7000::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 1BA201EA8D0;
	Wed, 12 Aug 2026 22:36:55 +0800 (AWST)
Message-ID: <523c7404-6ef2-4cc2-a3b9-8ff1d0e4559d@davidgow.net>
Date: Wed, 12 Aug 2026 22:36:52 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kunit: tool: fix _list_tests filtering wrong variable
 when list has TAP prefix
To: Mohammad abukhader <mohammad.abukhader@hotmail.com>,
 "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>
Cc: "raemoar63@gmail.com" <raemoar63@gmail.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "kunit-dev@googlegroups.com" <kunit-dev@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <b8f72a24-c280-4a67-90c0-4194a81a724b@linuxfoundation.org>
 <20260803190059.36491-1-mohammad.abukhader@hotmail.com>
From: David Gow <david@davidgow.net>
Content-Language: fr
In-Reply-To: <20260803190059.36491-1-mohammad.abukhader@hotmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 04/08/2026 à 3:02 AM, Mohammad abukhader a écrit :
> From: Mohammad Abu-Khader <mohammad.abukhader@hotmail.com>
> 
> `_list_tests()` runs the kernel to list tests, strips printk timestamp
> lines via `extract_tap_lines()`, then drops the dummy TAP header from
> the cleaned `lines`.  However the subsequent regex filter mistakenly
> operates on the original `output` instead of the cleaned `lines`.  When
> the kernel output includes timestamp prefixes (common with UML or slower
> setups), e.g.:
> 
>   [    0.100000] suite.test1
>   [    0.100000] suite.test2
> 
> the anchored regex `^[^\s.]+\.[^\s.]+$` rejects them and `--list_tests`
> returns an empty list.
> 
> Filter `lines` instead of `output`, matching the behavior of the
> adjacent `_list_tests_attr()` which already returns the cleaned list.
> 
> Add a regression test with timestamp-prefixed input to verify the fix.
> 
> Fixes: 723c8258c8fe ("kunit: tool: Add command line interface to filter and report attributes")
> Signed-off-by: Mohammad Abu-Khader <mohammad.abukhader@hotmail.com>
> ---

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>  tools/testing/kunit/kunit.py           |  2 +-
>  tools/testing/kunit/kunit_tool_test.py | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
> index ac3f7159e67f..91d234ac3b57 100755
> --- a/tools/testing/kunit/kunit.py
> +++ b/tools/testing/kunit/kunit.py
> @@ -126,7 +126,7 @@ def _list_tests(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest)
>  	lines.pop()
>  
>  	# Filter out any extraneous non-test output that might have gotten mixed in.
> -	return [l for l in output if re.match(r'^[^\s.]+\.[^\s.]+$', l)]
> +	return [l for l in lines if re.match(r'^[^\s.]+\.[^\s.]+$', l)]
>  
>  def _list_tests_attr(linux: kunit_kernel.LinuxSourceTree, request: KunitExecRequest) -> Iterable[str]:
>  	args = ['kunit.action=list_attr']
> diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
> index da88c3a1651d..85ae21754bdf 100755
> --- a/tools/testing/kunit/kunit_tool_test.py
> +++ b/tools/testing/kunit/kunit_tool_test.py
> @@ -979,6 +979,18 @@ class KUnitMainTest(unittest.TestCase):
>  		self.linux_source_mock.run_kernel.assert_called_once_with(
>  			args=['kunit.action=list'], build_dir='.kunit', filter_glob='suite*', filter='', filter_action=None, timeout=300)
>  
> +	def test_list_tests_with_prefix(self):
> +		want = ['suite.test1', 'suite.test2', 'suite2.test1']
> +		self.linux_source_mock.run_kernel.return_value = [
> +			'[    0.100000] TAP version 14',
> +			'[    0.200000] suite.test1',
> +			'[    0.200000] suite.test2',
> +			'[    0.300000] suite2.test1']
> +
> +		got = kunit._list_tests(self.linux_source_mock,
> +				     kunit.KunitExecRequest(None, None, None, False, False, '.kunit', 300, 'suite*', '', None, None, 'suite', False, False, False))
> +		self.assertEqual(got, want)
> +
>  	@mock.patch.object(kunit, '_list_tests')
>  	def test_run_isolated_by_suite(self, mock_tests):
>  		mock_tests.return_value = ['suite.test1', 'suite.test2', 'suite2.test1']


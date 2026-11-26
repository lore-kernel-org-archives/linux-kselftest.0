Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.242.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697927;
	b=MOHOnKKn+Vv5vzZTxvbj37C9gdbvp9RVW0XKjQKOaafycTG9q0O6MraDIce5IDdXOJ4W
	 VvQM1yj0q5yqtNSaFfKACqjq3zn286wDiTxkM9vTwDllObs17RXfpK2hWY0bTuy+fFItq
	 pjWPVqae4wc4Au8Ulwp2qCpeNEj0mp9XMSa/3y5L0+xCgm96ojLaPVo/ucQD7rZzCG6L7
	 OkiZsAYTFXGOII5mzsow/JS+11ThaV1dZg+mgEPxT2ovm4nWuZzkjgRzqfE4PVoeT5f0W
	 gEveP+FOMIVjC0pMnzOONUMBO63lznfqfGrFStSCOnpOJwI/mS/DULZ7unBjXIlyQ+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697927;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=qB3lSYw1rvOjDnaiKBqyMQHLWF/XyU8BdrApZZgC+XM=;
	b=YFFcQYwFGUKpE7yqdYPUC+dhjrxlkBtu7sxl02VcEskYTRJDqW4Re8hI8ud98bf05rJk
	 iTTWXgT1XTBlIxL+IwgzvDoSOEc/qVt4dklvj+nCUjddM+H5AVsRG6yuxots2GcKFSWC7
	 +QGDlFhP1OFB8I/6r5alLMRPRlFP0tG0rT5PaFpgO72lohaQ81NQycm/lIn7UY1fdi7SK
	 JO0EHqdIwAa9CaUFz0ChItiQ5Wr0887e+x2aj9dLydQcHCotk5aSWt6/fFkj5wkrJnj9m
	 x0iQvhPSL9mjZ1I+gToIEmThgtqKrC1Y679/Fx6Gs1M6qrsq2ETDSi400ly4AQEtzpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=davidgow.net;
	spf=pass smtp.mailfrom=davidgow.net;
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b="iyl/ZXEc";
	dkim=pass header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=eEPD88H4;
	arc=none smtp.remote-ip=203.29.242.92
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A885606A31C;
	Thu, 26 Nov 2026 12:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A885606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=iyl/ZXEc;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.a=rsa-sha256 header.s=201606 header.b=eEPD88H4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795697924;
	bh=I3eHiFg8pUDJXxMSmIUcMWSUwT8HFyrcL9KR9V2p1lk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iyl/ZXEcwRa9fhLQMHuw5xr8mwzq7/3sbfcWU8yyu4XllWrKuDBhve+FXYkHqRGRt
	 fRlR92iZRiwWZwG5nngVwB5bxe2DGSXJ21YFyoFXy3N77vlwYB+q6WFgzu541MWwwq
	 EBm09k6VLEbCYVUryTztEghOdKOIOMVL/oS2ukQ+neI72UuQ9wr+pyPhMHz2YXwWmi
	 o9M/4IY6UPrkAQvAHZDcCymA6fPB8em7WUgiNXsoYR9kUKcrLxW48PZtmmn6/URSsK
	 fuUE/4w1FM2vkfSznM7LbiWvBc8u4ZHZOSlViec3pX5pDYtdkCEFFGuFrD9yctcGTA
	 nJUPTRDrJRb/1LJ9UBRDgjMF7GYjiTA/Li8iFNik1KDs2og628sa2brsdzsWkTMUjA
	 CsG0b5Ow8J8e+boYMJjXHAO95AFgOGltNTk7OC/V4k/ms1Js2vuHmu/20C4knX9mIt
	 ckmE7IfhOUFP/X4PbltLG31AzCNyhDXowbvbJLpk4aERju+42Ku583wqqAAv+n+JnH
	 BJrEz6RxR8wrRoDmDcT8jaEP0Q3InEX/VvjWj1/MyLh0dlh/Fxz7Vi+G82x6MvSUQ7
	 hxTVvr4d7dwcTPaGQa49+qWaCxbYe8/xBfTwO/thqU4jOzg21G/zh/YD4FdLm8PZOT
	 /BfWo5s6kz8ahbqPIBy6h3Sc=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 04EDF1EADB6; Thu, 26 Nov 2026 20:58:44 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1795697921;
	bh=I3eHiFg8pUDJXxMSmIUcMWSUwT8HFyrcL9KR9V2p1lk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eEPD88H406G08prRpIAmdGOVvA/01wffAeBbEr7aG1GRQ159XXc9Gbk5h6vu403Am
	 uZr2VAl0gf3ZIQgSmegAngpcaFJVdZJY8vsx9xIM6wmI2YkESskxf3nogKJGHQONY1
	 ITHpRKPh9Z4QLeoFGRdC2zqFqLvPBwNIFPR2FP8LO9j4f6tt9ajW5Jq18Wm6adj9+y
	 7mIywaExgL/hbgI9PtfIpOshAt77orbnYRla9yrufZZYmQAte69sk3GBlSQW65Uq3l
	 hJlU8KzVcCR9oU5aN3hlFQ9W3teKXLZj9tj1vqkQ161NF97lrChxc70Y96w4UmpwPy
	 b9gfO62Q8ShQh1hYehQX+PnV5lKdB4Ge9qukPqKeYCL8t0ucGf7MLN3yYPkgL4mwcs
	 CKS4v6jZCWPoqy3LpvsAeqtxnA74dDsyPaBWyq9fRmLUNrkdG03Q9WLL32dgZvbq67
	 aYQKvLuWhdwRYrI4LmczCpQMSzm1YMsrMUCgchir057eo/jLDzTtSMYAMfnyyGipVd
	 Wuesk30VUMoEgvydafre4rLffqAPZZg4Km0dY2LblT9JfmxXnpUdnHnzQagRaA2e6B
	 zD+P5Wv0my3dXm0Gv0aPwjDMZlZyY5jp4NNorMJgF3V/AMdte97znyRXnIPI0widSf
	 QxEuLzM51HL+hv/OkSUo/b3s=
Received: from [IPV6:2001:8003:8802:7000::41b] (unknown [IPv6:2001:8003:8802:7000::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 739071EADB1;
	Thu, 26 Nov 2026 20:58:41 +0800 (AWST)
Message-ID: <e590b8c6-9718-4faf-827b-4afa82002089@davidgow.net>
Date: Thu, 26 Nov 2026 20:58:39 +0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kunit: tool: Preserve suite ancestry in JUnit test
 identities
To: Matus Daniil <matus.daniil@gmail.com>,
 Brendan Higgins <brendan.higgins@linux.dev>
Cc: Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
References: <CAJeAFep5wgtRpHwANoeqJkWE38y=9zQQ9e7moQw-3rE47b=wFw@mail.gmail.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <CAJeAFep5wgtRpHwANoeqJkWE38y=9zQQ9e7moQw-3rE47b=wFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 14/11/2026 à 17:17, Matus Daniil a écrit :
> From: Daniil Matus <matus.daniil@mail.ru>
> 
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
> Fixes: e9e05c72752f ("kunit: tool: Add (primitive) support for
> outputting JUnit XML")
> Signed-off-by: Daniil Matus <matus.daniil@mail.ru>
> ---

Hi,

Thanks very much for your patch.

Unfortunately, it looks like your email client has mangled it somewhat: 
some of the lines have been wrapped.

This is a known issue with some email programs: particularly with gmail. 
The file Documentation/process/email-clients.rst has some details about 
different clients:
https://docs.kernel.org/process/email-clients.html

But I'd personally recommend either using git send-email:
- https://git-send-email.io
or the b4 tool:
- https://b4.docs.kernel.org/en/latest/

Those will ensure that the patch will be sent properly, so that 
maintainers can use git to apply it automatically. I personally use git 
send-email for my patches, and once it's set up, it works great.

Cheers,
-- David


>   tools/testing/kunit/kunit_junit.py     | 10 +++++++---
>   tools/testing/kunit/kunit_tool_test.py | 14 ++++++++++++++
>   2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/kunit/kunit_junit.py
> b/tools/testing/kunit/kunit_junit.py
> index 362207035..d5730aebe 100644
> --- a/tools/testing/kunit/kunit_junit.py
> +++ b/tools/testing/kunit/kunit_junit.py
> @@ -10,7 +10,8 @@ from kunit_parser import Test, TestStatus
>   from typing import Optional
> 
>   # Get a string representing a tes suite (including subtests) in JUnit XML
> -def get_test_suite(test: Test, parent: Optional[ET.Element]) -> ET.Element:
> +def get_test_suite(test: Test, parent: Optional[ET.Element],
> name_prefix: str = '') -> ET.Element:
> +	classname = f'{name_prefix}.{test.name}' if name_prefix else test.name
>   	suite_attrs = {
>   		'name': test.name,
>   		'tests': str(test.counts.total()),
> @@ -26,9 +27,12 @@ def get_test_suite(test: Test, parent:
> Optional[ET.Element]) -> ET.Element:
> 
>   	for subtest in test.subtests:
>   		if subtest.subtests:
> -			get_test_suite(subtest, test_suite_element)
> +			get_test_suite(subtest, test_suite_element, classname)
>   			continue
> -		test_case_element = ET.SubElement(test_suite_element, 'testcase',
> {'name': subtest.name})
> +		test_case_element = ET.SubElement(test_suite_element, 'testcase', {
> +			'name': subtest.name,
> +			'classname': classname,
> +		})
>   		if subtest.status == TestStatus.FAILURE:
>   			ET.SubElement(test_case_element, 'failure', {}).text = 'Test Failed'
>   		elif subtest.status == TestStatus.SKIPPED:
> diff --git a/tools/testing/kunit/kunit_tool_test.py
> b/tools/testing/kunit/kunit_tool_test.py
> index 85ae21754..d37354c70 100755
> --- a/tools/testing/kunit/kunit_tool_test.py
> +++ b/tools/testing/kunit/kunit_tool_test.py
> @@ -18,6 +18,7 @@ import os
>   import signal
>   import subprocess
>   import sys
> +import xml.etree.ElementTree as ET
>   from typing import Iterable
> 
>   import kunit_config
> @@ -725,6 +726,19 @@ class KUnitJUnitTest(unittest.TestCase):
>   		self.assertTrue("tests=\"0\"" in result)
>   		self.assertFalse("testcase" in result)
> 
> +	def test_nested_test_classnames_junit(self):
> +		result = self._junit_string('test_is_test_passed-all_passed_nested.log')
> +		testcases = ET.fromstring(result).iter('testcase')
> +		self.assertEqual([
> +			('main.sysctl_test', 'sysctl_test_dointvec_null_tbl_data'),
> +			('main.sysctl_test.example', 'example_simple_test'),
> +			('main.sysctl_test.example', 'example_mock_test'),
> +			('main.sysctl_test', 'sysctl_test_dointvec_table_len_is_zero'),
> +			('main.sysctl_test', 'sysctl_test_dointvec_table_read_but_position_set'),
> +			('main.example', 'example_simple_test'),
> +			('main.example', 'example_mock_test'),
> +		], [(case.get('classname'), case.get('name')) for case in testcases])
> +
> 
>   class KUnitMainTest(unittest.TestCase):
>   	def setUp(self):
> 
> base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa


Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E385CCA4E;
	Fri, 27 Feb 2026 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772183648; cv=none; b=j7n4WEqmu6hzUbaH9YeqB1PFJ0xCuD6rVhOEJkoSFN04HjC+XTHrtPxOqONXnYqcZ4tnS7tdIa0AqMIwRtHOAIW4vm3kHM3d8mvVvrGtt3fqVmy/7yUPvUsZxS8ulLDlJBcJ08fhMHpKTIcPoJPD8B2Fw7QclwX/ewp1LqVDEZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772183648; c=relaxed/simple;
	bh=KEtIErQMHsU3HYVNgTieOZ1CyBhqo4GEqS1JOYo5cZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WlFph7j5okilPQRhRcPNpwtUYV+9XgUo4jwczv3cboyNthd18dqV9HBoiFicAHvAWE/bDW/o7946MmabnlBO8OlhGEQ2m8W1E/i+V7Qy4Oc34Kt1CBoCCHWWMzKJiCRyV26Unf2DFOdEXL3DVRnxKQJfpbxhPJ7lOBgP4neExy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=ajzZriaX; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=PclzBmZ/; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="ajzZriaX";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="PclzBmZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772183638;
	bh=KEtIErQMHsU3HYVNgTieOZ1CyBhqo4GEqS1JOYo5cZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ajzZriaX1kUxt5eDQQPJnxO2UsJLTC4rH0YWlbGm0QKPx7Wx9nR5iqxbQWM+/dugs
	 tfANEcS7iEL+gQi9MLYAmvI6Swa5Y4DiOnXeyzmojjfdEWgNFvjygRVKACVcS5RqNW
	 lcZ4c0AFvkggDHDF2EWPr8WsCEGUw7oICbhq8WdgIR2riZUkGvnRHM8gfpZLYvgJSQ
	 v9aX9xkC8dY/rWpmfSyJqBhRXD4QNqJp19sTnzjbq7xYb7IDfvFH/EJf+fDowAcoXz
	 OSMep7UHJJKgfUyVWQISoxqec1Gsw48f72qeYdqIBVHOaviYubwGbdI6M17bQINRqf
	 si89Wn8o1J0VUBDgNfCk9ddtWUHsfRdSDNAnkGY0pXQwQ45c4pq/7jgL+E42fqdJMP
	 xW3Ofj4gSmKUptnFWueVri3fkmLMUSV9XW9fNsJDk4f+jmwPa3KCH0Sl0sZp+sktKn
	 r41yOMvf/Qh7hQP3LR/xIMi06E9zg8A2c3ZM13I4YHD9tK1QlOQ1Nc3edpRmsMVbGE
	 EtzNwRZBuI+99rzO3Hc4FgNS1ECUZW6cdbni6EYu3fuG1czB/GB5iJrlDWKJcqwSvz
	 4NedANEw4u6FiOIDPPhRYv4Chz2fK4RgQ6bT71Y5wSSM7FVWRYkfgtCO0u1WG84tLC
	 PQTnWSpB46GENpMVC9JDrQpg=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 22FC91E7A2D; Fri, 27 Feb 2026 17:13:58 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772183636;
	bh=KEtIErQMHsU3HYVNgTieOZ1CyBhqo4GEqS1JOYo5cZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PclzBmZ/LXrh24R7m9HLvK0HXsmruOIYA9QmcA8CdqKONBTNDjfF8SHj9mEeX4hxm
	 C+X25+keWQifM/hsX0IfA35jL3w9jeSwkpqOklkova4Zp1t/dHSRjlEt7ncO9J+MFu
	 4rkgaAJi1UnAe2NinQCQtCE6Ufqrt5rDlFXruG5f1AvfR2Mj4Lv6dLhw4gpkqh+4qL
	 /GvyYRI7xGqk+mRPe+OKl9JTlBTqETtgGspTc4YRYfrPYGzigBANcK1wO5MlyAmN66
	 SwiPKWTZpPZTWnZBONajtZ7lYlqxMcjYD3sGGPWo41R3FbNWPGbovYjkjEZwTT1CaP
	 lvdwWasxK7fGixImhnFfhgqdA+17M4YQ1grezHpHe/Pnh1eAtAHHy8QetdRl62a65y
	 gkqYSLYC7jkDq9AwCJqr6omQbCdFNd/y1brlz9SerYvlDyx5wqHjv5f++GH4nbgQ6j
	 3i9X15eo4Xe9PcZuLSmpMjmvNBAHRafuGjfpx2hVxlxYBQRhnUsnfwOJ84ySEssehz
	 mmE+bXQ0UFT4osprOW8qq0csPqTMKiivYMXwWrFjJ0AOQz7YqaddfLbrkLKOEPaq/K
	 2N7zjEzUg4GslVH9IZazroSmoXsZFdoSy+vYNrQGWW7MqhargvS0k6lhXB7bEBHnsR
	 QIf5IRGDR1eFdObw6aa3OKGU=
Received: from [IPV6:2001:8003:8824:9e00:6d16:7ef9:c827:387c] (unknown [IPv6:2001:8003:8824:9e00:6d16:7ef9:c827:387c])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id C44921E7A28;
	Fri, 27 Feb 2026 17:13:56 +0800 (AWST)
Message-ID: <55be6364-ba3f-4b26-b2de-924ef49639fe@davidgow.net>
Date: Fri, 27 Feb 2026 17:13:53 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kunit: tool: copy caller args in run_kernel to prevent
 mutation
To: Shuvam Pandey <shuvampandey1@gmail.com>, brendan.higgins@linux.dev
Cc: raemoar63@gmail.com, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
References: <20260226152910.34530-1-shuvampandey1@gmail.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <20260226152910.34530-1-shuvampandey1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 26/02/2026 à 11:29 PM, Shuvam Pandey a écrit :
> run_kernel() appended KUnit flags directly to the caller-provided args
> list. When exec_tests() calls run_kernel() repeatedly (e.g. with
> --run_isolated), each call mutated the same list, causing later runs
> to inherit stale filter_glob values and duplicate kunit.enable flags.
> 
> Fix this by copying args at the start of run_kernel(). Add a regression
> test that calls run_kernel() twice with the same list and verifies the
> original remains unchanged.
> 
> Fixes: ff9e09a3762f ("kunit: tool: support running each suite/test separately")
> Signed-off-by: Shuvam Pandey <shuvampandey1@gmail.com>
> ---

Nice catch!

Reviewed-by: David Gow <david@davidgow.net>

Thanks,
-- David

>   tools/testing/kunit/kunit_kernel.py    |  6 ++++--
>   tools/testing/kunit/kunit_tool_test.py | 26 ++++++++++++++++++++++++++
>   2 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/kunit/kunit_kernel.py b/tools/testing/kunit/kunit_kernel.py
> index 260d8d9aa1db..2998e1bc088b 100644
> --- a/tools/testing/kunit/kunit_kernel.py
> +++ b/tools/testing/kunit/kunit_kernel.py
> @@ -346,8 +346,10 @@ class LinuxSourceTree:
>   		return self.validate_config(build_dir)
>   
>   	def run_kernel(self, args: Optional[List[str]]=None, build_dir: str='', filter_glob: str='', filter: str='', filter_action: Optional[str]=None, timeout: Optional[int]=None) -> Iterator[str]:
> -		if not args:
> -			args = []
> +		# Copy to avoid mutating the caller-supplied list. exec_tests() reuses
> +		# the same args across repeated run_kernel() calls (e.g. --run_isolated),
> +		# so appending to the original would accumulate stale flags on each call.
> +		args = list(args) if args else []
>   		if filter_glob:
>   			args.append('kunit.filter_glob=' + filter_glob)
>   		if filter:
> diff --git a/tools/testing/kunit/kunit_tool_test.py b/tools/testing/kunit/kunit_tool_test.py
> index b67408147c1f..f6383884c599 100755
> --- a/tools/testing/kunit/kunit_tool_test.py
> +++ b/tools/testing/kunit/kunit_tool_test.py
> @@ -503,6 +503,32 @@ class LinuxSourceTreeTest(unittest.TestCase):
>   			with open(kunit_kernel.get_outfile_path(build_dir), 'rt') as outfile:
>   				self.assertEqual(outfile.read(), 'hi\nbye\n', msg='Missing some output')
>   
> +	def test_run_kernel_args_not_mutated(self):
> +		"""Verify run_kernel() copies args so callers can reuse them."""
> +		start_calls = []
> +
> +		def fake_start(start_args, unused_build_dir):
> +			start_calls.append(list(start_args))
> +			return subprocess.Popen(['printf', 'KTAP version 1\n'],
> +						text=True, stdout=subprocess.PIPE)
> +
> +		with tempfile.TemporaryDirectory('') as build_dir:
> +			tree = kunit_kernel.LinuxSourceTree(build_dir,
> +					kunitconfig_paths=[os.devnull])
> +			with mock.patch.object(tree._ops, 'start', side_effect=fake_start), \
> +			     mock.patch.object(kunit_kernel.subprocess, 'call'):
> +				kernel_args = ['mem=1G']
> +				for _ in tree.run_kernel(args=kernel_args, build_dir=build_dir,
> +							 filter_glob='suite.test1'):
> +					pass
> +				for _ in tree.run_kernel(args=kernel_args, build_dir=build_dir,
> +							 filter_glob='suite.test2'):
> +					pass
> +				self.assertEqual(kernel_args, ['mem=1G'],
> +					'run_kernel() should not modify caller args')
> +				self.assertIn('kunit.filter_glob=suite.test1', start_calls[0])
> +				self.assertIn('kunit.filter_glob=suite.test2', start_calls[1])
> +
>   	def test_build_reconfig_no_config(self):
>   		with tempfile.TemporaryDirectory('') as build_dir:
>   			with open(kunit_kernel.get_kunitconfig_path(build_dir), 'w') as f:
> 
> base-commit: f4d0ec0aa20d49f09dc01d82894ce80d72de0560


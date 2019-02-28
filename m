From: dietmar.eggemann@arm.com (Dietmar Eggemann)
Date: Thu, 28 Feb 2019 19:36:17 +0100
Subject: [PATCH v3 1/2] Provide in-kernel headers for making it easy to
 extend the kernel
In-Reply-To: <20190228164801.iahwphx5o2zeks4n@e107158-lin.cambridge.arm.com>
References: <20190227193748.132301-1-joel@joelfernandes.org>
 <20190228135343.23kzkilig3bsioov@e107158-lin.cambridge.arm.com>
 <20190228144759.GA156098@google.com>
 <b100f0a2-7966-b6a2-dcd5-ca11abe57ead@arm.com>
 <20190228164801.iahwphx5o2zeks4n@e107158-lin.cambridge.arm.com>
Message-ID: <df3c8773-bda1-edcf-757b-9dc1c77cc4cf@arm.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190228183617.RMwmGqIuMVQ_4mbzsEulq8YNItUTQwtXNsa83PZ2k4o@z>

On 2/28/19 5:48 PM, Qais Yousef wrote:
> On 02/28/19 17:04, Dietmar Eggemann wrote:
>> Hi Joel,
>>
>> On 2/28/19 3:47 PM, Joel Fernandes wrote:
>>> On Thu, Feb 28, 2019@01:53:43PM +0000, Qais Yousef wrote:
>>>> Hi Joel
>>>>
>>>> On 02/27/19 14:37, Joel Fernandes (Google) wrote:

[...]

>> The reason for me to stay on v4.20 is that with v5.0-rc8 I don't have ebpf
>> 'raw tracepoint' support any more on my arm64 board. But this issue is not
>> related to your patch though.
> 
> And this is caused by a38d1107f937 (bpf: support raw tracepoints in modules)
> which renamed bpf_find_raw_tracepoint() which bcc-tools relies on to detect if
> raw tracepoints are supported..
> 
> https://github.com/iovisor/bcc/blob/master/src/python/bcc/__init__.py#L860
> 
> Speaking of fragile depedencies :-)
> 
> I guess the check can be extended to check for both symbols - but it'll stay
> fragile. Not sure if they can do better.
> 
> I filed a bug
> 
> https://github.com/iovisor/bcc/issues/2240

This did the trick for me on v5.0-rc8. Thanks, Qais!

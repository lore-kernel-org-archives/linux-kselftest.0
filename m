From: daniel@iogearbox.net (Daniel Borkmann)
Date: Fri, 18 May 2018 19:23:21 +0200
Subject: [PATCH bpf-next 0/5] fix test_sockmap
In-Reply-To: <7ca8b025-c152-b0c9-a58b-cff722c2223e@kernel.org>
References: <20180518071753.4768-1-bhole_prashant_q7@lab.ntt.co.jp>
 <7ca8b025-c152-b0c9-a58b-cff722c2223e@kernel.org>
Message-ID: <d0e3bb4a-7491-1da5-d068-15559ebd360a@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180518172321.I5kyy_TTE-yOZ3T3B-lNQFhK3KGoOep8lzeN0eZ58G0@z>

On 05/18/2018 06:54 PM, Shuah Khan wrote:
> On 05/18/2018 01:17 AM, Prashant Bhole wrote:
>> This series fixes bugs in test_sockmap code. They weren't caught
>> previously because failure in RX/TX thread was not notified to the
>> main thread.
>>
>> Also fixed data verification logic and slightly improved test output
>> such that parameters values (cork, apply, start, end) of failed test
>> can be easily seen.
>>
>> Note: Even after fixing above problems there are issues with tests
>> which set cork parameter. Tests fail (RX thread timeout) when cork
>> value is non-zero and overall data sent by TX thread isn't multiples
>> of cork value.
>>
>> Prashant Bhole (5):
>>   selftests/bpf: test_sockmap, check test failure
>>   selftests/bpf: test_sockmap, join cgroup in selftest mode
>>   selftests/bpf: test_sockmap, fix test timeout
>>   selftests/bpf: test_sockmap, fix data verification
>>   selftests/bpf: test_sockmap, print additional test options
>>
>>  tools/testing/selftests/bpf/test_sockmap.c | 76 +++++++++++++++++++++++-------
>>  1 file changed, 58 insertions(+), 18 deletions(-)
> 
> Please remember to cc linux-kselftest mailing list as well. I would like to see
> all the test patches cc'ed to it. Linaro and other test users watch the kselftest
> mailing list. I also have patchwork project now to manage the patch volume.
> 
> I am okay with patches going through net/bpf trees - there are always test
> dependencies on net/bpf trees.

Yep, routing all the BPF selftest patches via bpf/bpf-next tree is the only
viable model that works for us in BPF case, in fact also looks like BPF
selftests are the busiest subdir in #commits so avoiding merge conflicts is
crucial. Whenever appropriate, most fixes or new features are very often
accompanied in a patch set with extensive selftests for BPF, so it has a
deep dependency on the two trees.

Best,
Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

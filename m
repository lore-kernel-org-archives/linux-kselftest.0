From: daniel@iogearbox.net (Daniel Borkmann)
Date: Thu, 22 Nov 2018 12:11:30 +0100
Subject: selftests/bpf :get_cgroup_id_user: File not found:
 /sys/kernel/debug/tracing/events/syscalls/sys_enter_nanosleep/id
In-Reply-To: <CAH3MdRVOFSQYYYNL_43o5DuXuShqQWhVutzQ5rpytenhObPWxQ@mail.gmail.com>
References: <CA+G9fYuruRUVVqR669UCB4vjAh5H==Ry3_sbFMQytMu+BZme7w@mail.gmail.com>
 <CAH3MdRVOFSQYYYNL_43o5DuXuShqQWhVutzQ5rpytenhObPWxQ@mail.gmail.com>
Message-ID: <9169029f-f70e-55d2-6adc-a68ff8486761@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181122111130.iAgURsymPUihgPS7K0DTw5uiLTLfL0iBorSaiIGk5nQ@z>

Hi Naresh,

On 11/21/2018 06:53 PM, Y Song wrote:
> On Wed, Nov 21, 2018 at 3:44 AM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
>>
>> Kselftest bpf get_cgroup_id_user is failed on all devices.
>>
>> selftests: bpf: get_cgroup_id_user
>> main:PASS:setup_cgroup_environment
>> main:PASS:create_and_get_cgroup
>> main:PASS:join_cgroup
>> main:PASS:bpf_prog_load
>> main:PASS:bpf_find_map
>> main:PASS:bpf_find_map
>> main:FAIL:open err -1 errno 2
>> not ok 1..15 selftests: bpf: get_cgroup_id_user [FAIL]
>>
>> The strace output shows,
>> This expected file not found,
>> "/sys/kernel/debug/tracing/events/syscalls/sys_enter_nanosleep/id"
>>
>> bpf(BPF_MAP_UPDATE_ELEM, {map_fd=5, key=0x7fff0c68c138,
>> value=0x7fff0c68c13c, flags=BPF_ANY}, 72) = 0
>> open(\"/sys/kernel/debug/tracing/events/syscalls/sys_enter_nanosleep/id\",
>> O_RDONLY) = -1 ENOENT (No such file or directory)
>> write(1, \"main:FAIL:open err -1 errno 2\n\", 30main:FAIL:open err -1 errno 2
>>
>> Am I missing any pre-requirement ?
> 
> You probably miss kernel config CONFIG_FTRACE_SYSCALLS.

If that does the trick for you, could you add that to the BPF kselftest
config snippet?

Thanks,
Daniel

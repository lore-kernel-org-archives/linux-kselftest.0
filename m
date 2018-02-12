From: zhijianx.li@intel.com (Li Zhijian)
Date: Mon, 12 Feb 2018 17:58:36 +0800
Subject: [Linux-kselftest-mirror] [kselftests] compaction_test is blocked
In-Reply-To: <30e882ea-1e79-44bf-9a85-c0be105ec218@intel.com>
References: <700acd92-2b0b-d2da-615e-1f228708d216@cn.fujitsu.com>
 <20180209211119.xbch2eok6holyvel@xps>
 <7c95e7cc-1955-ba99-9aa5-4bf5d994bd58@cn.fujitsu.com>
 <30e882ea-1e79-44bf-9a85-c0be105ec218@intel.com>
Message-ID: <5cdc12c4-a85f-f1bd-8008-52296f90da3a@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180212095836.6H8EWzt_ey2nrkZ15l96a0u877zcEyqqd83LIdo9EUg@z>



On 2018年02月12日 11:26, Li Zhijian wrote:
>
>
> On 2018年02月11日 13:44, Li Zhijian wrote:
>>
>>
>> On 02/10/2018 05:11 AM, Dan Rue wrote:
>>> On Fri, Feb 09, 2018@03:53:59PM +0800, Li Zhijian wrote:
>>>> Hi
>>>>
>>>> kselftests is integrated Intel 0Day project.
>>>> Sometimes we found compaction_test is blocked for more than 1 hours 
>>>> until i kill it.
>>>>
>>>> Try to figure out where it is running, i added some log to this case.
>>>>
>>>> the test log is like:
>>>> -------------------
>>>>   [  111.750543] main: 248
>>>>   [  111.750544]-
>>>>   [ 111.750821] check_compaction: 98
>>>>   [  111.750822]-
>>>>   [  111.751102] check_compaction: 105
>>>>   [  111.751103]-
>>>>   [  111.751362] check_compaction: 111
>>>>   [  111.751363]-
>>>>   [  111.751621] check_compaction: 118
>>>>   [  111.751622]-
>>>>   [  111.751879] check_compaction: 123
>>>>   [  111.751880]-
>>>> -------------------
>>>> 118         fprintf(stderr, "%s: %d\n", __func__, __LINE__);
>>>> 119         lseek(fd, 0, SEEK_SET);
>>>> 120
>>>> 121         /* Request a large number of huge pages. The Kernel 
>>>> will allocate
>>>> 122            as much as it can */
>>>> 123         fprintf(stderr, "%s: %d\n", __func__, 
>>>> __LINE__);         <<<======== the last line we can catch.
>>>> 124         if (write(fd, "100000", (6*sizeof(char))) != 
>>>> (6*sizeof(char))) {        <<<<============ blocking position
>>>> 125                 perror("Failed to write 100000 to 
>>>> /proc/sys/vm/nr_hugepages\n");
>>>> 126                 goto close_fd;
>>>> 127         }
>>>> 128
>>>> 129         lseek(fd, 0, SEEK_SET);
>>>> 130
>>>> 131         fprintf(stderr, "%s: %d\n", __func__, __LINE__);
>>>> 132         if (read(fd, nr_hugepages, sizeof(nr_hugepages)) <= 0) {
>>>> 133                 perror("Failed to re-read from 
>>>> /proc/sys/vm/nr_hugepages\n");
>>>> 134                 goto close_fd;
>>>> 135         }
>>>> -------------------
>>>>
>>>> According to above log and code, it most likely it is blocking at 
>>>> the writing operation.
>>>>
>>>> my environment is like:
>>>> OS: debian
>>>> kernel: v4.15
>>>> model: Ivytown Ivy Bridge-EP
>>>> nr_cpu: 48
>>>> memory: 64G
>>> Hi Zhijian,
>>>
>>> Please try this patch in mainline:
>>>
>>>      4c1baad22390 kselftest: fix OOM in memory compaction test
>>
>> Hi Dan
>>
>> Thanks for your replies.
>>
>> I run this case on v4.15, looks this patch is already merged to v4.15.
>> lizhijian at inn:~/linux$ git describe 4c1baad
>> v4.15-rc2-2-g4c1baad223906
>
> My mistake, this path is not contained by v4.15 yet.
> i will have a try.
Hi Dan,

I ran this case on this commit 4c1baad22390, this issue still occurs.

root at ivb44 ~# dmesg | tail -n 30
[  105.825870] main: 247

[  105.825994] main: 242

[  105.826130] main: 247

[  105.826250] main: 242

[  105.826394] main: 247

[  105.826506] main: 242

[  105.826617] main: 247

[  105.826728] main: 242

[  105.826840] main: 247

[  105.826950] main: 250

[  105.827272] check_compaction: 98

[  105.827589] check_compaction: 105

[  105.827849] check_compaction: 111

[  105.828152] check_compaction: 118

[  105.828451] check_compaction: 123


the runtime code is like
-------------------
110
111         fprintf(stderr, "%s: %d\n", __func__, __LINE__);
112         /* Start with the initial condition of 0 huge pages*/
113         if (write(fd, "0", sizeof(char)) != sizeof(char)) {
114                 perror("Failed to write 0 to 
/proc/sys/vm/nr_hugepages\n");
115                 goto close_fd;
116 }
117
118         fprintf(stderr, "%s: %d\n", __func__, __LINE__);
119         lseek(fd, 0, SEEK_SET);
120
121         /* Request a large number of huge pages. The Kernel will 
allocate
122            as much as it can */
123         fprintf(stderr, "%s: %d\n", __func__, __LINE__);
124         if (write(fd, "100000", (6*sizeof(char))) != 
(6*sizeof(char))) {
125                 perror("Failed to write 100000 to 
/proc/sys/vm/nr_hugepages\n");
126                 goto close_fd;
127         }
-------------------

Thanks
>
> Thanks
>
>
>
>>
>> Thanks
>>
>>> Dan
>>>
>>>>
>>>> NOTE: 0Day can reproduce this issue in 20% on 0Day.
>>>>
>>>> Anybody can help have a look?
>>>>
>>>> Thanks
>>>> Zhjian
>>>>
>>>>
>>>>
>>>> -- 
>>>> To unsubscribe from this list: send the line "unsubscribe 
>>>> linux-kselftest" in
>>>> the body of a message to majordomo at vger.kernel.org
>>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>>
>>> .
>>>
>>
>

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

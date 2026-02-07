disp('Hello World!')
disp('I am going to learn MATLAB')
disp('I started learning MATLAB on ' + string(startString))


tau = 1.5*24*60*60;
endOfClass = 5*24*60*60;
knowledgeAtTheEnd = 1 - exp(-endOfClass/tau);
disp(['At the end of 6.057, I will know '  num2str(knowledgeAtTheEnd)  '% of MATLAB'])

secPerMin = 60;
secPerHour = secPerMin * 60;
secPerDay = secPerHour * 24;
secPerMonth = secPerDay * 30.5;
secPerYear = secPerMonth * 12;

secondConversion = [secPerYear secPerMonth secPerDay secPerHour secPerMin 1];
currentTime = clock;
elapsedTime = currentTime - start
t = secondConversion * elapsedTime.';

currentKnowledge = 1 - exp(-t/tau);

disp(['At this time, I know ' num2str(currentKnowledge) '% of MATLAB'])

tVec = 0:10000:endOfClass;
knowledgeVec = 1 - exp(-tVec/tau);



[~, ind] = min(abs(knowledgeVec - 0.5))


halfTime = tVec(ind)

disp(['I will know half of MATLAB after ' num2str(halfTime/secPerDay) ' days'])

figure
plot((tVec/secPerDay), knowledgeVec)